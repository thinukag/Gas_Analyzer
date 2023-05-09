import 'package:flutter/material.dart';
import 'package:flutter_application_1/store/models/orders.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/Background.png"),
              fit: BoxFit.cover,
            )),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartPdt(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].name,
                    cart.items.values.toList()[i].number,)),
          ),
          CheckoutButton(
            cart: cart,
          ),
          FlatButton(
              onPressed: () {},
              child: Text(
                '',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ))
        ],
      ),
    );
  }
}

class CheckoutButton extends StatefulWidget {
  final Cart cart;

  const CheckoutButton({@required this.cart});
  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Confirm', style: TextStyle(color: Colors.blue, fontSize: 20),),
      onPressed: widget.cart.totalAmount <= 0
          ? null
          : () async {
              await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(), widget.cart.totalAmount);
              widget.cart.clear();
            },
    );
  }
}

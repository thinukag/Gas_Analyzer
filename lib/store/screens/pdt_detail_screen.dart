import 'package:flutter/material.dart';
import '../models/products.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/product-detail';
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPdt = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(loadedPdt.name),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/Background.png"),
              fit: BoxFit.cover,
            )),
            height: 400,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(loadedPdt.imgUrl),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Price: \LKR ${loadedPdt.price}',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              '${loadedPdt.description}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displaySnackBar(context);
          //child: Text('Display SnackBar');
          cart.addItem(productId, loadedPdt.name, loadedPdt.price, loadedPdt.number);
        },
        child: Icon(
          Icons.shopping_cart,
          size: 30,
        ),
      ),
    );
  }

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Item Added to Cart'));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

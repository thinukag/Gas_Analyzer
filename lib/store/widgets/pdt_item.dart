import 'package:flutter/material.dart';
import 'package:flutter_application_1/store/screens/pdt_detail_screen.dart';
import 'package:provider/provider.dart';
import '../models/products.dart';
import '../models/cart.dart';

class PdtItem extends StatelessWidget {
  final String name;
  final String number;
  final String imageUrl;

  PdtItem({this.name, this.number, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailPage.routeName, arguments: pdt.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridTile(
          child: Card(
            color: Colors.transparent,
            margin: EdgeInsets.all(5.0),
            child: InkWell(
              // onTap: () {
              //            Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => GasPercentage()),
              //   );
              // },
              splashColor: Colors.red,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      //fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  //child: Text("YOUR TEXT"),
                ),
              ),
            ),
          ),
          //child: Image.network(imageUrl),
          footer: GridTileBar(
            title: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            trailing: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black54,
                ),
                onPressed: () {
                  //Show 
                  Scaffold.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Item Added to Cart'),
                  ));
                  cart.addItem(pdt.id, pdt.name, pdt.price, pdt.number);
                }),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

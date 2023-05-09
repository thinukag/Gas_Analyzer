import 'package:flutter/material.dart';
import 'package:flutter_application_1/store/widgets/home_body.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cart_screen.dart';

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(
            'Store',
            style: GoogleFonts.varelaRound(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(CartScreen.routeName)),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                ),
              ),
            )
          ],
        ),
        body: HomeBody());
  }
}

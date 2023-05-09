import 'package:flutter/material.dart';

import '../widgets/all_pdts.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/Background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            AllProducts()
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';


class Stock extends StatefulWidget {
  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/Background.png'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
      )),
      child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          primary: false,
          children: [
            Card(
              shadowColor: Colors.white,
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(
                left: 30,
                top: 30,
                
              ),
              child: Column(
                children: [
                  InkWell(
                   child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/gas12.5k.png',
                          ),
                          height: 120,
                        ),
                        Text('Litro 12.5kg'),
                        Text('Available - 11'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              shadowColor: Colors.white,
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(
                right: 30,
                top: 30,
              ),
              child: Column(
                children: [
                  InkWell(
                   child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/gas5k.png',
                          ),
                          height: 120,
                        ),
                        Text('Litro 5kg'),
                        Text('Available - 15'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              shadowColor: Colors.white,
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(
                left: 30,
                top: 30,
              ),
              child: Column(
                children: [
                  InkWell(
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/Untitled-2.png',
                          ),
                          height: 120,
                        ),
                        Text('Litro 5kg'),
                        Text('Available - 8'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
           
            Card(
              shadowColor: Colors.white,
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(
                left: 0,
                right: 30,
                top: 30,
              ),
              child: Column(
                children: [
                  InkWell(
                   child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/laugfs 12.5.png',
                          ),
                          height: 120,
                        ),
                        Text('Laughfs 12.5kg'),
                        Text('Available - 10'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              shadowColor: Colors.white,
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(
                left: 30,
                top: 30,
              ),
              child: Column(
                children: [
                  InkWell(
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/laugfs 5kg.png',
                          ),
                          height: 120,
                        ),
                       Text('Laughfs 5kg'),
                       Text('Available - 20'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              shadowColor: Colors.white,
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(
                
                right: 30,
                top: 30,
              ),
              child: Column(
                children: [
                  InkWell(
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/laughfs2kg.png',
                          ),
                          height: 120,
                        ),
                        Text('Laughfs 2kg'),
                        Text('Available - 5'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
          crossAxisCount: 2),
    );
  }
}

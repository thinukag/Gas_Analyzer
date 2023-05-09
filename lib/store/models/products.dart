import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String category;
  final String name;
  final String description;
  final String imgUrl;
  final double price;
  final String number;

  Product(
      {@required this.id,
      @required this.category,
      @required this.name,
      @required this.description,
      @required this.imgUrl,
      @required this.price,
      @required this.number});
}

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: '1',
      name: 'Litro 12.5kg',
      imgUrl: 'assets/images/gas12.5k.png',
      price: 1493,
      category: 'Business',
      description: 'Litro 12.5kg Gas',
      number: '0777858384',
    ),
    Product(
      id: '2',
      name: 'Litro 5kg',
      imgUrl: 'assets/images/gas5k.png',
      price: 598,
      category: 'Business',
      description: 'Litro 5kg Gas',
      number: '0777858384',
    ),
    Product(
      id: '3',
      name: 'Litro 2.3kg',
      imgUrl: 'assets/images/gas5k.png',
      price: 289,
      category: 'Fiction',
      description: 'Litro 2.3kg Gas',
      number: '0777858384',
    ),
    Product(
      id: '4',
      name: 'Laughfs 12.5kg',
      imgUrl: 'assets/images/laugfs 12.5.png',
      price: 1501,
      category: 'Romantc',
      description: 'Laughfs 12.5kg Gas',
      number: '0777858384',
    ),
    Product(
      id: '5',
      name: 'Laughfs 5kg',
      imgUrl: 'assets/images/laugfs 5kg.png',
      price: 601,
      category: 'Games',
      description: 'Laughfs 5kg Gas',
      number: '0777858384',
    ),
    Product(
      id: '6',
      name: 'Laughfs 2kg',
      imgUrl: 'assets/images/laughfs2kg.png',
      price: 242,
      category: 'Laptops',
      description: 'Laughfs 2kg Gas',
      number: '0777858384',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }
}

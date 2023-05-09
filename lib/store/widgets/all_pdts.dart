import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/products.dart';
import './pdt_item.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final pdts = productData.items;
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: pdts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.5),
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: pdts[i],
          child: PdtItem(
            name: pdts[i].name,
            number: pdts[i].number,
            imageUrl: pdts[i].imgUrl,
          )),
    );
  }
}

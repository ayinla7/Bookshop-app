import 'package:flutter/material.dart';
import 'package:shopping_cart/constants/constants.dart';
import 'package:shopping_cart/helper/data_helper.dart';
import 'package:shopping_cart/model/shopping.dart';
import 'package:shopping_cart/shopping_cart_page.dart';


class ProductList2 extends StatefulWidget {

  @override
  _ProductList2 createState() {
    return new _ProductList2();
  }
}

class _ProductList2 extends State<ProductList2> {
  var TotalKey = GlobalKey<FormState>();
  List<Shopping> allProduct = DataHelper.allShoppingList;

  @override
  Widget build(BuildContext context) {
    return allProduct.length > 0
        ? ListView.builder(
        itemCount: allProduct.length,
        itemBuilder: (context, index) {
          return Card(
                 child: ListTile(
                  onTap: () {
                    setState(() {
                      DataHelper.delShopping(allProduct[index].ISBN);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(allProduct[index].productName + ' removed from Cart!'),
                    ));
                  },
                    title: Text(allProduct[index].productName),
                    // leading: const Icon(Icons.shopping_basket,
                    //     color: Colors.purple),
                    subtitle: Text((allProduct[index].productNumber *
                        allProduct[index].productPrice)
                        .toString()),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                    trailing: Icon(Icons.cancel),
                ),
              );
        })
        : Center(
      child: Text(
        'Please add something to cart',
        style: TextConstants.addCartTextStyle,
      ),
    );
  }

}




import 'package:flutter/material.dart';
import 'package:shopping_cart/models/Cart.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_cart/model/shopping.dart';
import 'package:shopping_cart/helper/data_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
   // required this.cart,
    required this.shopping,

  }) : super(key: key);

  //final Cart cart;
  final Shopping shopping;

  @override
  Widget build(BuildContext context) {
    return DataHelper.allShoppingList.length > 0 ?
    Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
            //  child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        ),
        Text("  "),
        Expanded(
          flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shopping.productName,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "${DataHelper.currency()}${shopping.productPrice}",
               // text: "${DataHelper.currency()}${cart.product.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${shopping.productNumber}",
                   //   text: " x${cart.numOfItem}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          ],
        ),
        ),
        Expanded(
    flex: 1,
    child:
        InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () async{
                //setState(() {})
              for (int a = 0; a < DataHelper.allShoppingList.length; a++) {
                if (DataHelper.allShoppingList[a].ISBN == shopping.ISBN) {
                  DataHelper.allShoppingList.remove(DataHelper.allShoppingList[a]);
                }
              }

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Item removed from Cart!'),
                ));
                },
                child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                height: getProportionateScreenWidth(28),
                width: getProportionateScreenWidth(28),
                decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.15),
                shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                "assets/icons/add.svg",
                color: Color(0xFFFF4848),
                ),
                ),
                ),
    ),
      ],
    )
        : Center(
          child: Text(
            'Please add something to cart',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          )
    );
  }
}




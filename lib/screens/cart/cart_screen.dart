import 'package:flutter/material.dart';
import 'package:shopping_cart/models/Cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:shopping_cart/models/Product.dart';
import 'package:shopping_cart/components/product_card.dart';
import '../../../size_config.dart';
import 'package:shopping_cart/test.dart';

import 'package:shopping_cart/model/shopping.dart';
import 'package:shopping_cart/widgets/show_money.dart';
import 'package:shopping_cart/helper/data_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_cart/models/Product.dart';
import 'package:shopping_cart/screens/details/details_screen.dart';
import 'package:shopping_cart/stocklevel.dart';

import 'components/body.dart';
import 'package:shopping_cart/helper/data_helper.dart';
import 'package:shopping_cart/home/home_page.dart';
import 'components/cart_card.dart';
import 'components/check_out_card.dart';
import 'package:shopping_cart/addressPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_cart/models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_cart/components/default_button.dart';
import 'package:shopping_cart/helper/data_helper.dart';
import '../../../CheckOutPage.dart';
import '../../../size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_cart/models/Product.dart';
import 'package:shopping_cart/model/shopping.dart';
import 'package:shopping_cart/helper/data_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_cart/constants/constants.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:shopping_cart/addressPage.dart';


import '../../../size_config.dart';
import 'package:shopping_cart/screens/cart/components/cart_card.dart';
import 'package:shopping_cart/helper/data_helper.dart';


class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreen createState() => _CartScreen();

  @override
  Widget build(BuildContext context) {
    return CartViewHomeLayout();
  }
}

class _CartScreen extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return CartViewHomeLayout();
  }
}

class CartViewHomeLayout extends StatefulWidget {
  @override
  CartViewHome createState() {
    return new CartViewHome();
  }
}

class CartViewHome extends State<CartViewHomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: DataHelper.allShoppingList.length,
          itemBuilder: (context, index) =>
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(demoCarts[index].product.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    // setState(() {
                    //   demoCarts.removeAt(index);
                    // });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  //child: CartCard(cart: demoCarts[index]),
                  child: DataHelper.allShoppingList.length > 0 ?
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
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(10)),
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
                              DataHelper.allShoppingList[index].productName,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16),
                              maxLines: 2,
                            ),
                            SizedBox(height: 10),
                            Text.rich(
                              TextSpan(
                                text: "${DataHelper.currency()}${DataHelper
                                    .allShoppingList[index].productPrice}",
                                // text: "${DataHelper.currency()}${cart.product.price}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor),
                                children: [
                                  TextSpan(
                                      text: " x${DataHelper
                                          .allShoppingList[index]
                                          .productNumber}",
                                      //   text: " x${cart.numOfItem}",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyText1),
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
                          onTap: () async {
                            setState(() {
                              DataHelper.delShopping(
                                  DataHelper.allShoppingList[index].ISBN);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Item removed from Cart!'),
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(
                                getProportionateScreenWidth(8)),
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
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      )
                  ),
                  // child: CartCard(shopping: DataHelper.allShoppingList[index]),
                ),
              ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(15),
          horizontal: getProportionateScreenWidth(30),
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            )
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: getProportionateScreenWidth(40),
                    width: getProportionateScreenWidth(40),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset("assets/icons/receipt.svg"),
                  ),
                  Spacer(),
                  Text("Add voucher code"),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kTextColor,
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          text: "${DataHelper.currency()} ${DataHelper
                              .Total()}",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(190),
                    child: DefaultButton(
                      text: "Check Out",
                      press: () {
                        Navigator.push(context, new MaterialPageRoute(builder: (
                            context) => AddressPage()));
                        //Navigator.push(context, new MaterialPageRoute(builder: (context) => CheckOutPage()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFF4848),
      shadowColor: Colors.white,
      foregroundColor: Colors.white,
      title: Column(
        children: [
          Text("Your Cart (${DataHelper.allShoppingList.length.toString()})",
            style: TextStyle(color: Colors.white),
          ),
          // Text(
          //   "${DataHelper.allShoppingList.length} items",
          //   style: Theme.of(context).textTheme.caption,
          // ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          textColor: Colors.white,
          onPressed: () =>
              showDialog<String>(
                context: context,
                builder: (BuildContext context) =>
                    AlertDialog(
                      title: const Text('CLEAR CART?'),
                      content: const Text(
                          'Click OK to clear all selected books from cart.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                                  (Route<dynamic> route) => false,
                            );
                            DataHelper.clearShopping();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
              ),
          child: Text("Clear cart"),
        ),
      ],
    );
  }

}







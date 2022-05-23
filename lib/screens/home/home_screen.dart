import 'package:flutter/material.dart';
import 'package:shopping_cart/components/coustom_bottom_nav_bar.dart';
import 'package:shopping_cart/enums.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}


// body: GridView.count(
// scrollDirection: Axis.vertical,
// crossAxisCount: 2,
// padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
// children: [
// SizedBox(height: getProportionateScreenWidth(20)),
// ...List.generate(
// demoProducts.length, (index) {
// return ProductCard(product: demoProducts[index]);
// },
// ),
// SizedBox(height: getProportionateScreenWidth(70)),
// ]
// ),
// );
// }
// }

//////////
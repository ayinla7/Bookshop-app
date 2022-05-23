import 'package:flutter/material.dart';

import 'package:shopping_cart/add_to_stock.dart';
import '../../../size_config.dart';
import '../../../size_config.dart';

class AddStockPage extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color(0xFFFF4848),
        title: Column(
          children: [
            Text("NEW BOOK",
              style: TextStyle(color: Colors.white),
            ),],
        ),),
      body: AddToStock(),
    );
  }
}

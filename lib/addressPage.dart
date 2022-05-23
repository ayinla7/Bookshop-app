import 'package:flutter/material.dart';
import 'package:shopping_cart/address.dart';
import '../../../size_config.dart';
import '../../../size_config.dart';

class AddressPage extends StatelessWidget {
  static String routeName = "/address";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF4848),
        title: Text("Delivery Details"),
      ),
      body: Address(),
    );
  }
}

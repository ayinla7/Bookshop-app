// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:shopping_cart/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/constants/constants.dart';
import 'package:shopping_cart/widgets/product_list.dart';
import 'package:shopping_cart/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import 'package:shopping_cart/model/shopping.dart';
import 'package:shopping_cart/widgets/show_money.dart';
import 'package:shopping_cart/widgets/product_list.dart';
import 'package:shopping_cart/constants/constants.dart';
import 'package:shopping_cart/helper/data_helper.dart';

class ShowPrice extends StatelessWidget {
  final double TotalPrice;

  const ShowPrice({Key? key, required this.TotalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          TotalPrice.toStringAsFixed(2).toString(),
          style: TextConstants.totalPriceStyle,
        ),
      ],
    );
  }
}

class ShowQuantity extends StatelessWidget {
  final int Totalquantity;

  const ShowQuantity({Key? key, required this.Totalquantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Totalquantity.toString());
  }
}

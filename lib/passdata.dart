import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import 'package:shopping_cart/model/shopping.dart';
import 'package:shopping_cart/shopping_cart_page.dart';
import 'package:shopping_cart/home/home_page.dart';
import 'package:shopping_cart/widgets/show_money.dart';
import 'package:shopping_cart/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import 'package:shopping_cart/model/shopping.dart';
import 'package:shopping_cart/widgets/show_money.dart';
import 'package:shopping_cart/widgets/product_list.dart';

import 'package:shopping_cart/constants/constants.dart';
import 'package:shopping_cart/helper/data_helper.dart';


class CallbacksWidget extends StatelessWidget {
  final Function(String dateTime) onChangeDate;
  final Function(String text) onChangeText;
  CallbacksWidget({required this.onChangeDate,required this.onChangeText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(height: 6.0),
          TextField(
            decoration: InputDecoration(
                labelText: "Text",
                hintText: "Insert some text",
                border: OutlineInputBorder()),
            onChanged: (value) {
              onChangeText(value);
            },
          ),
          Container(height: 6.0),
          RaisedButton(
            child: Text("GetTime"),
            onPressed: () {
              var dateTime = "dd/MM/yyyy—HH:mm:ss:S";
              onChangeDate(dateTime);
            },
          ),
        ],
      ),
    );

  }
}
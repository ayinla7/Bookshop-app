import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:shopping_cart/helper/data_helper.dart';
import 'package:shopping_cart/model/shopping.dart';
import 'package:shopping_cart/test.dart';
import 'package:shopping_cart/thankyou.dart';
import 'package:shopping_cart/utils/CustomTextStyle.dart';
import 'package:shopping_cart/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/components/custom_surfix_icon.dart';
import 'package:shopping_cart/components/default_button.dart';
import 'package:shopping_cart/components/form_error.dart';
import 'package:shopping_cart/screens/otp/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_cart/helper/data_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../../constants.dart';
import 'package:basic_utils/basic_utils.dart';
import '../../../size_config.dart';
import 'dart:ffi';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'helper/address_helper.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0xFFFF4848),
          leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.black,),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: const Text(
            "Complete Order",
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
        body: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ListView(
                    children: <Widget>[selectedAddressSection(), standardDelivery(), checkoutItem(), priceSection()],
                  ),
                ),
                flex: 90,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: RaisedButton(
                    onPressed: () => modal(context),
                    child: Text(
                      "Place Order",
                      style: CustomTextStyle.textFormFieldMedium
                          .copyWith(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    color:  Color(0xFFFF4848),

                    textColor: Colors.white,

                  ),
                ),
                flex: 10,
              )
            ],
          );
        }),
      ),
    );
  }

  void showSlideupView(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            child: new GestureDetector(
              onTap: () => Navigator.pop(context),
              child: new Text("Click me to close this non-modal bottom sheet"),
            ),
          );
        });
  }
  late Future<Books> futureBooks;

  modal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context)
        {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 70,
                    padding: EdgeInsets.only(
                        left: 0.0, top: 20.0, right: 0.0, bottom: 10.0),
                    child: Image.asset(
                      "assets/images/visa.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 3),
                  child: Center(
                    child: Text("SWIFT PAYMENT",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.blue),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 12,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Card number',
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(child: const TextField(
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'CVV',
                            ),
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded( // wrap your Column in Expanded
                      child: Column(
                        children: <Widget>[
                          Container(child: const TextField(
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Expiry date',
                            ),
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                  ],
                ),

                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                  child: GestureDetector(
                    onTap: () async {
                      int a;
                      for (a=0; a<DataHelper.allShoppingList.length; a++) {
                        print(DataHelper.allShoppingList[a].ISBN);
                        print(DataHelper.allShoppingList[a].productNumber);
                        DataHelper.getquantity(
                            DataHelper.allShoppingList[a].ISBN);


                        Map<String, String> headers = {
                          'Accept': 'application/json',
                        };

                        Map <String, dynamic> body = {
                          "ISBN": "book1".toString(),
                          'quantity': (int.parse(DataHelper.getquantity(
                              DataHelper.allShoppingList[a].ISBN)) - DataHelper.allShoppingList[a].productNumber).toString()

                        };

                        Map <String, String> queryParameters = {
                          'quantity': (int.parse(DataHelper.getquantity(
                              DataHelper.allShoppingList[a].ISBN)) - DataHelper.allShoppingList[a].productNumber).toString()
                        };
                        Map<String, dynamic> responseData = await HttpUtils
                            .putForJson(
                            "https://voyagebucket-matchhobby-8080.codio-box.uk/api/v1/books/" +
                                DataHelper.allShoppingList[a].ISBN.toString(),
                            body: convert.jsonEncode(body).toString(),
                            headers: headers, queryParameters: queryParameters);
                        print(responseData.toString());
                      }


                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ThankYouPage(),
                          )
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Center(
                        child: Text(
                          'Pay',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]
          );
        });
  }

  selectedAddressSection() {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)), border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "James Francois (Account)",
                    style: CustomTextStyle.textFormFieldSemiBold.copyWith(fontSize: 14),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Text(
                      "DELIVERY DETAILS",
                      style:
                          CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.indigoAccent.shade200, fontSize: 8),
                    ),
                  )
                ],
              ),

              createAddressText(AddressHelper.AddressList[0], 16),
              createAddressText(AddressHelper.AddressList[1], 6),
              createAddressText(AddressHelper.AddressList[2], 16),
              createAddressText(AddressHelper.AddressList[3], 6),
              createAddressText(AddressHelper.AddressList[4], 16),
              SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Mobile : ",
                      style: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: 12, color: Colors.grey.shade800)),
                  TextSpan(
                      text: AddressHelper.AddressList[5],
                      style: CustomTextStyle.textFormFieldBold.copyWith(color: Colors.black, fontSize: 12)),
                ]),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                color: Colors.grey.shade300,
                height: 1,
                width: double.infinity,
              ),
              addressAction()
            ],
          ),
        ),
      ),
    );
  }

  createAddressText(String strAddress, double topMargin) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      child: Text(
        strAddress,
        style: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: 12, color: Colors.grey.shade800),
      ),
    );
  }

  addressAction() {
    return Container(
      child: Row(
        children: <Widget>[
          Spacer(
            flex: 2,
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Edit / Change",
              style: CustomTextStyle.textFormFieldSemiBold.copyWith(fontSize: 12, color: Colors.indigo.shade700),
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ],
      ),
    );
  }

  standardDelivery() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.tealAccent.withOpacity(0.4), width: 1),
          color: Colors.tealAccent.withOpacity(0.2)),
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: 1,
            onChanged: (isChecked) {},
            activeColor: Colors.tealAccent.shade400,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Standard Delivery",
                style: CustomTextStyle.textFormFieldMedium
                    .copyWith(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Get it by 20 Apr - 23 Apr",
                style: CustomTextStyle.textFormFieldMedium.copyWith(
                  color: Colors.black,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  checkoutItem() {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)), border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: ListView.builder(
            itemBuilder: (context, position) {
              final Shopping shopping = DataHelper.allShoppingList[position];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                        Text(
                            shopping.productName , style: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: 12)),
                        Text(
                            (shopping.productNumber).toString(),
                            style: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: 12, fontWeight: FontWeight.w600)),
                        Text(
                            (shopping.productPrice).toString(),
                            style: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: 12, fontWeight: FontWeight.w600)),
              ]
                ),
              );
            },
            itemCount: int.parse(DataHelper.cart_count()),
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }

  priceSection() {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)), border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 4,
              ),
              Text(
                "PRICE DETAILS",
                style: CustomTextStyle.textFormFieldMedium
                    .copyWith(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 8,
              ),
              createPriceItem("Tax", DataHelper.currency() +"0", Colors.grey.shade700),
              createPriceItem("Order Total", DataHelper.currency() + DataHelper.Total().toString() , Colors.grey.shade700),
              createPriceItem("Delivery Charges", DataHelper.currency() +  DataHelper.postTotal().toString(), Colors.teal.shade300),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Total",
                    style: CustomTextStyle.textFormFieldSemiBold.copyWith(color: Colors.black, fontSize: 18),
                  ),
                  Text(
                    // getFormattedCurrency(2013),
                    DataHelper.currency() +  (DataHelper.postTotal()+DataHelper.Total()).toString(),
                    style: CustomTextStyle.textFormFieldMedium.copyWith(color: Colors.teal.shade300, fontSize: 18),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  createPriceItem(String key, String value, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            key,
            style: CustomTextStyle.textFormFieldMedium.copyWith(color: Colors.grey.shade700, fontSize: 12),
          ),
          Text(
            value,
            style: CustomTextStyle.textFormFieldMedium.copyWith(color: color, fontSize: 12),
          )
        ],
      ),
    );
  }
}
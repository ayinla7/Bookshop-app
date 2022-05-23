import 'package:flutter/material.dart';
import 'package:shopping_cart/components/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart/helper/address_helper.dart';
import 'package:shopping_cart/helper/data_helper.dart';
import 'dart:convert' as convert;
import '../../../constants.dart';
import '../../../size_config.dart';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'CheckOutPage.dart';


class Address extends StatefulWidget {
  static String routeName = "/Address";
  @override
  _Address createState() => _Address();
}

class _Address extends State<Address> {
  final _formKey = GlobalKey<FormState>();

  String? fline;
  String? sline;
  String? postalcode;
  String? City;
  String? telephone;
  String? Country;
  Color _statusColor =Color(0xFFFF4848);

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      key: _formKey,
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    // SizedBox(height: SizeConfig.screenHeight * 0.03),
                    // Text("Delivery Details", style: headingStyle),
                    SizedBox(height: SizeConfig.screenHeight * 0.0),
                    Column(
                      children: [
                        SizedBox(height: getProportionateScreenHeight(20)),
                        buildflineFormField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildslineFormField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildpostalcodeFormField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildCityFormField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildCountryFormField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildTelephoneFormField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        DefaultButton(
                          text: "Continue",
                          press: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            }
                            try {
                              if (fline != "" && telephone!= ""){
                                AddressHelper.AddressList.clear();
                                AddressHelper.addAddress(fline ?? "--",
                                     sline ?? "--",
                                     postalcode ?? "--",
                                     City ?? "--",
                                     Country ?? "--",
                                     telephone ?? "--");

                                Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutPage()));
                                print(AddressHelper.AddressList);
                                print(DataHelper.allShoppingList[0].toString());
                              }else{

                              }
                            }catch(e){
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    AlertDialog(
                                      title: const Text( "Error!"),
                                      content: Text(e.toString()),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'OK'),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                      ],
                    ),
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
  TextFormField buildflineFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => fline = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please enter first line of address");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First line of address",
        hintText: "Enter first line of address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildslineFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => sline = newValue,
      decoration: InputDecoration(
        labelText: "Second line of address",
        hintText: "Enter second line of address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildCountryFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => Country = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter Country name");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Country",
        hintText: "Enter the Country name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildpostalcodeFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => postalcode = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter Postal Code");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Postal Code",
        hintText: "Enter the Postal Code",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildCityFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => City = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter name of City");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "City",
        hintText: "Enter the name of City",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildTelephoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => telephone = newValue.toString(),
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter Telephone number");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Telephone",
        hintText: "Enter telephone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
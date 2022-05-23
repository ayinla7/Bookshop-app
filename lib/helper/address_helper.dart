import 'package:flutter/material.dart';
import 'package:shopping_cart/model/shopping.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddressHelper {
  static List<String> AddressList = [];

  static addAddress(String fline,String sline, String postcode, String City,
      String Country, String Telephone ) {
    AddressList.add(fline);
    AddressList.add(sline);
    AddressList.add(postcode);
    AddressList.add(City);
    AddressList.add(Country);
    AddressList.add(Telephone);
  }
}
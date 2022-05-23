import 'package:flutter/material.dart';
import 'package:shopping_cart/model/shopping.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataHelper {
  static List<Shopping> allShoppingList = [];
  static int listLenght = postTotal() ;
  static List<List> quantityList= [];

  static getquantity(String ISBN)
  {
    int a;
    for (a=0; a< quantityList.length; a++){
      if(quantityList[a][0]== ISBN){
        return quantityList[a][1];
      }
    }
  }



  static get_listLenght(){
    return listLenght;
  }

  static addShopping(Shopping shopping) {
    if (allShoppingList.length > 0) {
      int count = 0;
      for (int a = 0; a < allShoppingList.length; a++) {
        if (allShoppingList[a].ISBN == shopping.ISBN) {
          // allShoppingList[a].productPrice =
          //     allShoppingList[a].productPrice + shopping.productPrice;

          allShoppingList[a].productNumber =
              allShoppingList[a].productNumber + 1;
          count = count + 1;
          //print(count);
        }
      }
      if (count == 0) {
        allShoppingList.add(shopping);
      }
    } else {
      allShoppingList.add(shopping);
    }
  }

  static delShopping(String ISBN) {
      for (int a = 0; a < allShoppingList.length; a++) {
        if (allShoppingList[a].ISBN == ISBN) {
          print(allShoppingList[a].ISBN);
          allShoppingList.remove(allShoppingList[a]);
          print(allShoppingList);
        }
      }
  }
  static clearShopping(){
    allShoppingList.clear();
  }

  static cart_count() {
    int length;
    if (allShoppingList.length < 1) {
      length = 0;
    } else {
      length = allShoppingList.length;
    }
    return (length.toString());
  }


  static postTotal() {
    int total = 0;
    allShoppingList.forEach((element) {
      total = total + 3;
      print(element.productNumber);
      print(element.productName);
      print(element.ISBN);
      print(element.productPrice);
      int x = element.productNumber - 1 ;
      if (x > 0){
        for (int r = 0; r < x ; r++){
          print(element.productNumber);
          total = total+ 1;
        }
      }
      print(total);
    });
    return total;
  }


  static Total() {
    double totalMoney = 0;
    String x;
    allShoppingList.forEach((element) {
      x =
      (totalMoney + (element.productNumber) * (element.productPrice)).toStringAsFixed(2);
      totalMoney = double.parse(x);
    });
    return totalMoney;
  }

  static currency() {
    return "£";
  }

  static valid(String countryname) async{
    final response = await http
        .get(Uri.parse('https://restcountries.com/v3.1/all'));
    if (response.statusCode == 200) {
      print("I am Here2");

      String domain = 'restcountries.com';
      String path = '/v3.1/all';
      Uri uri = Uri.https(domain, path);

      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-type': 'application/json'
      };
      http.Response response = await http.get(
        uri,
        headers: headers,
      );
      List jsonGetCountries = jsonDecode(response.body);
      Map <String, dynamic> countryCode = {};
      int count = 1;
      for (Map<String, dynamic> country in jsonGetCountries) {
        count++;
        countryCode[country["name"]["common"]] =
            country["currencies"].toString().substring(1, 4);
      }
      countryCode.remove("United States");
      countryCode["United States of America"] = 'USD';
      //print(countryCode);

      return countryCode[countryname];
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Countries Currencies');
    }
  }


}

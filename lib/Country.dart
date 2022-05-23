import 'package:flutter/material.dart';
import 'package:shopping_cart/model/shopping.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Country {

  Future<Countries> futureCountries = fetchCountries(0.0,0.0);
  static String Currencycode = " ";



  static getCurrencycode() {
    Currency("Ireland").then((result) {
      //print(result);
      Currencycode = result;
      print(Currencycode);
    }
    );
  }
    String getCurrencycode2(double lat, double lon){
      fetchCountries(lat, lon).then((Countries result) =>
          Currency(result.countryname).then((result2) {
            Currencycode = result2 ;
            print(Currencycode);
          })
      );
      return Currencycode;
    }





    // fetchCountries(37.4219983, -122.084).then((Countries result) =>
    //     Currency(result.countryname).then((result2) => x = result2.toString())
    // );

}


Future<String> Currency(String countryname) async{
  //print("I am Here2");

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
  // print(countryCode);

  return countryCode[countryname];
}


Future<Countries> fetchCountries(double lat, double lon) async {
  // lat 37.4219983
  // lon -122.084
  final response = await http
      .get(Uri.parse('https://eu1.locationiq.com/v1/reverse.php?key=pk.ea561e98b1ff252522b7d76d92d82125&lat=${lat}&lon=${lon}&format=json'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //print("I am Here");
    return Countries.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Countries');
  }
}

class Countries {
  final String displayname;
  final String countryname;

  const Countries({
    required this.displayname,
    required this.countryname,
  });

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
      displayname : json["display_name"],
      countryname: json["address"]["country"],
    );
  }
}
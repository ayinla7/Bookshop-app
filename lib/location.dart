import 'dart:ffi';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CurrentLocation extends StatefulWidget {
  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}
class _CurrentLocationState extends State<CurrentLocation> {
  String? currentLocation;
  @override
  void initState() {
    super.initState();
  }

  Position? position;
  void _getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          currentLocation ="Permission Denied";
        });
      }else{
        var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        setState(() {
          currentLocation ="latitude: ${position.latitude}" + " , " + "Logitude: ${position.longitude}";
        });
      }
    }else{
      var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        currentLocation ="latitude: ${position.latitude} , Longitude: ${position.longitude}";
      });
    }
  }

  String apireturnname = '';
  String apireturncurrencies = '';
  String countrieslenght = '';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      color: Colors.teal[50]
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Location',
                                ),
                                (currentLocation!=null)?Text(currentLocation.toString()):Container(),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ],
                  )),
              RaisedButton(
                color: Colors.blue[50],
                onPressed: () async{
                  _getCurrentLocation();

                  //Get countries Name - Currency code and
                  //   String domain = 'restcountries.com';
                  //   String path = '/v3.1/all';
                  //   Uri uri = Uri.https(domain, path);
                  //
                  //   Map<String, String> headers = {
                  //     'Accept': 'application/json',
                  //     'Content-type': 'application/json'
                  //   };
                  //
                  //   http.Response response = await http.get(
                  //     uri,
                  //     headers: headers,
                  //   );
                  //   List jsonGetCountries = convert.jsonDecode(response.body);
                  //   Map<String,
                  //       dynamic> eachcountry = await jsonGetCountries[1];
                  //   countrieslenght = jsonGetCountries.length.toString();
                  //
                  //   Map <String, dynamic> countryCode = {};
                  //   int count = 1;
                  //   for (Map<String, dynamic> country in jsonGetCountries) {
                  //     //print(count.toString() + " " +country["name"]["common"] +" "
                  //     //+ country["currencies"].toString().substring(1,4));
                  //     count++;
                  //     countryCode[country["name"]["common"]] =
                  //         country["currencies"].toString().substring(1, 4);
                  //   }
                  //   countryCode.remove("United States");
                  //   countryCode["United States of America"] = 'USD';
                  //
                  //
                  //
                  // setState(() {
                  //   apireturnname = countryCode["United States of America"];
                  //   countrieslenght = jsonGetCountries.length.toString();
                  //   apireturncurrencies = eachcountry["currencies"].toString().substring(1,4);
                  // });

                },
                child: const Text("Get Location"),
              ),
              Text(apireturnname),
            ],
          ),
        )
    );
  }
}

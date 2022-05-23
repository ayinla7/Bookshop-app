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

class AddToStock extends StatefulWidget {
  static String routeName = "/AddToStock";
  @override
  _AddToStock createState() => _AddToStock();
}

class _AddToStock extends State<AddToStock> {
  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  String? name;
  String? ISBN;
  String? author;
  String? description;
  bool remember = false;
  double _tprice = 0;
  double _rprice = 0;
  double _quantity = 0;
  //Color _statusColor = Colors.blue;
  Color _statusColor =Colors.black;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  //////////Image
  File? _image;

  Future getImagefromcamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _image = File(image!.path);
    });
    Navigator.pop(context);
  }

  Future getImagefromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image!.path);
    });
    Navigator.pop(context);
  }

  Future<void> _showChoiceDialog (BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("Choose option",style: TextStyle(color: Color(0xFFFF4848),)),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Color(0xFFFF4848),),
              ListTile(
                onTap: (){
                  getImagefromGallery();
                },
                title: Text("Gallery"),
                leading: Icon(Icons.account_box,color: Color(0xFFFF4848),),
              ),

              Divider(height: 1,color: Color(0xFFFF4848),),
              ListTile(
                onTap: (){
                  getImagefromcamera();
                },
                title: Text("Camera"),
                leading: Icon(Icons.camera,color: Color(0xFFFF4848),),
              ),
            ],
          ),
        ),);
    });
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
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
        child: Column(
        children: [
        SizedBox(height: SizeConfig.screenHeight * 0.03),
        // Text("NEW BOOK", style: headingStyle),
        const Text(
        "Add new Book with required details.",
        textAlign: TextAlign.center,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.06),
        Column(
          children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: _image == null
                          ? Text('NO IMAGE')
                          : Image.file(
                          _image!, width: 150, height: 150, fit: BoxFit.fill),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white),
                        ),
                        primary: Colors.white,
                        backgroundColor: Color(0xFFF5F6F9),
                      ),
                      onPressed: () {
                        _showChoiceDialog(context);
                      },
                      child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(_image == null
                      ? "No Image Selected!"
                      : _image!.path
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildISBNFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildAuthorFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildDescFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            Column(
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[
                  Text( "Date Published: "+
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(
                        // color: Colors.blue,
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  RaisedButton(
                    onPressed: () => _selectDate(context), // Refer step 3
                    child: Text(
                      'Select date',
                      style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
//                    color: Colors.blue,
                    color: Colors.blue,

                  ),
                ],
              ),
              ]
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            ////////TradePrice
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Trade Price: ${DataHelper.currency()}$_tprice',
                  style: TextStyle(color: _statusColor, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Slider(
                  min: 0.0, max: 100.0,
                  value: _tprice, divisions: 100,
                  onChanged: (value) {
                    setState(() {
                      _tprice = value;
                    });
                  },
                ),
              ],
            ),
            ////////////Retail Price
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Retail Price: ${DataHelper.currency()}$_rprice',
                  style: TextStyle(color: _statusColor, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Slider(
                  min: 0.0, max: 100.0,
                  value: _rprice, divisions: 100,
                  onChanged: (value) {
                    setState(() {
                      _rprice = value;
                    });
                  },
                ),
              ],
            ),
            ////////////Quantity
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Quantity Available: $_quantity',
                  style: TextStyle(color: _statusColor, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Slider(
                  min: 0.0, max: 20.0,
                  value: _quantity, divisions: 20,
                  onChanged: (value) {
                    setState(() {
                      _quantity = value;
                    });
                  },
                ),
              ],
            ),
            ///////////////
            SizedBox(height: getProportionateScreenHeight(30)),

            FormError(errors: errors),
            DefaultButton(
              text: "Continue",
              press: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
                 try {
                  print(ISBN);
                  print(name);
                  print(author);
                  print(description);
                  print(selectedDate);
                  print(_tprice);
                  print(_rprice);
                  print(_quantity);

                    Map<String, String> headers = {
                      'Accept': 'application/json',
                    };

                    Map <String, dynamic> body = {
                      "ISBN": "30000",
                      'name': name.toString(),
                      'author': author.toString(),
                      'publication_date': selectedDate.toString(),
                      'description': description.toString(),
                      // 'coverpage': _image == null
                      //     ? "No Image Selected!"
                      //     : _image!
                      //     .path,

                      'coverpage': "https://images-na.ssl-images-amazon.com/images/I/41n909olDRL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg",
                      'trade_price': _tprice.toString(),
                      'retail_price': _rprice.toString(),
                      'quantity': _quantity.toString()
                    };
                    Map <String, String> queryParameters = {
                      "ISBN": ISBN.toString(),
                      'name': name.toString(),
                      'author': author.toString(),
                      'publication_date': selectedDate.toString().substring(
                          0, 10),
                      'description': description.toString(),
                      'coverpage': "https://images-na.ssl-images-amazon.com/images/I/41s28Vu2KkL._SX326_BO1,204,203,200_.jpg",
                      'trade_price': _tprice.toString(),
                      'retail_price': _rprice.toString(),
                      'quantity': _quantity.toString()
                    };
                    Map<String, dynamic> responseData = await HttpUtils
                        .postForJson(
                        "https://voyagebucket-matchhobby-8080.codio-box.uk/api/v1/books",
                        body: convert.jsonEncode(body).toString(),
                        headers: headers, queryParameters: queryParameters);
                    print(responseData.toString());
                    ////////Successfully Added
                    if (responseData["status"] == "Success") {
                      String goodcon = responseData["message"].toString();
                      print(responseData);
                      showDialog<String>(
                        context: context,
                        builder: await (BuildContext context) =>
                            AlertDialog(
                              title: Text(responseData["status"] + "!"),
                              content: Text(
                                  "Succesfully added  new book to Bookshop"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Successfully added to BookShop!'),
                      ));
                      ////////Failed to Add
                    } else {
                      String con = responseData["message"].toString();
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) =>
                            AlertDialog(
                              title: Text(responseData["status"] + "!"),
                              content: Text(con),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Failed to add to BookShop!'),
                      ));
                    }

                }catch(e){
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>
                        AlertDialog(
                          title: Text( "Error!"),
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
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  TextFormField buildISBNFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => ISBN = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter ISBN");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "ISBN",
        hintText: "Enter the ISBN",
           floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => name = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter Name");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Book's Title",
        hintText: "Enter the book title",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildAuthorFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => author = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter Author");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Author",
        hintText: "Enter the book author",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildDescFormField() {
     return TextFormField(
       keyboardType: TextInputType.multiline,
       onSaved: (newValue) => description = newValue,
       validator: (value) {
         if (value!.isEmpty) {
           addError(error: "Please Enter Description");
           return "";
         }
         return null;
       },
       minLines: 2,
       maxLines: 5,
        decoration: InputDecoration(
          labelText: "Description",
          hintText: "Enter the book description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
        ),
      );
  }
}
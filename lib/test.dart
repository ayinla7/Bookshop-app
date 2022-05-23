import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Books> fetchBooks() async {
  final response = await http
      .get(Uri.parse('https://voyagebucket-matchhobby-8080.codio-box.uk/api/v1/books'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //print(response.body);
    Map <String, dynamic> api = jsonDecode(response.body);
    //List books = api["books"];
    //print(api["status"].toString());
    //print(books.length.toString());
    //print(api["books"][1].toString());
    //print(api["books"][2].toString());
    //print(api["message"].toString());

    return Books.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Books');
  }
}



class Books {
  final String message;
  final String status;
  final List books;
  const Books({
    required this.message,
    required this.status,
    required this.books,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      status: json['status'],
      message: json['message'],
      books: json['books'],
    );
  }
  @override
  String toString() {
    return '{ ${this.status}, ${this.message} , ${this.books} }';
  }
}





class User {
  String name;
  int age;
  User(this.name, this.age);
  factory User.fromJson(dynamic json) {
    return User(json['name'] as String, json['age'] as int);
  }
  @override
  String toString() {
    return '{ ${this.name}, ${this.age} }';
  }
}



class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  late Future<Books> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Books>(
            future: futureBooks,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.status);
              } else if (snapshot.hasError) {
                return Text('Error loading up Page');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
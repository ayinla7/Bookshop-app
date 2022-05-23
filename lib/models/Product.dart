import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;
  final String ISBN;
  final String author;
  final String publication_date;
  final String coverpage;
  final String trade_price;
  final String retail_price;
  final String quantity;


  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.name,
    required this.price,
    required this.description,
    required this.ISBN,
    required this.author,
    required this.publication_date,
    required this.coverpage,
    required this.trade_price,
    required this.retail_price,
    required this.quantity,
  });

}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    name: "Wireless Controller for PS4™",
    price: 10,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
      ISBN :"1",
      author: "-",
      publication_date :"-",
      coverpage:"-",
      trade_price:"-",
      retail_price:"-",
      quantity: "11"
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    name: "Nike Sport White - Man Pant",
    price: 50,
    description: description,
    rating: 4.1,
    isPopular: true,
    ISBN :"2",
    author: "-",
    publication_date :"-",
    coverpage:"-",
    trade_price:"-",
    retail_price:"-",
    quantity: "22"
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    name: "Gloves XC Omega - Polygon",
    price: 30,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
      ISBN :"3",
      author: "-",
      publication_date :"-",
      coverpage:"-",
      trade_price:"-",
      retail_price:"-",
      quantity: "33"
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    name: "Logitech Head",
    price: 20,
    description: description,
    rating: 4.1,
    isFavourite: true,
      ISBN :"4",
      author: "-",
      publication_date :"-",
      coverpage:"-",
      trade_price:"-",
      retail_price:"-",
      quantity: "44"
  ),
  Product(
      id: 5,
      images: [
        "assets/images/wireless headset.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      name: "Logitech Head",
      price: 20,
      description: description,
      rating: 4.1,
      isFavourite: true,
      ISBN :"4",
      author: "-",
      publication_date :"-",
      coverpage:"-",
      trade_price:"-",
      retail_price:"-",
      quantity: "44"
  ),
  Product(
      id: 6,
      images: [
        "assets/images/wireless headset.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      name: "Logitech Head",
      price: 20,
      description: description,
      rating: 4.1,
      isFavourite: true,
      ISBN :"4",
      author: "-",
      publication_date :"-",
      coverpage:"-",
      trade_price:"-",
      retail_price:"-",
      quantity: "44"
  ),
  Product(
      id: 7,
      images: [
        "assets/images/wireless headset.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      name: "Logitech Head",
      price: 20,
      description: description,
      rating: 4.1,
      isFavourite: true,
      ISBN :"4",
      author: "-",
      publication_date :"-",
      coverpage:"-",
      trade_price:"-",
      retail_price:"-",
      quantity: "44"
  ),
  Product(
      id: 8,
      images: [
        "assets/images/wireless headset.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      name: "Logitech Head",
      price: 20,
      description: description,
      rating: 4.1,
      isFavourite: true,
      ISBN :"4",
      author: "-",
      publication_date :"-",
      coverpage:"-",
      trade_price:"-",
      retail_price:"-",
      quantity: "44"
  ),
  Product(
      id: 9,
      images: [
        "assets/images/wireless headset.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      name: "Logitech Head",
      price: 20,
      description: description,
      rating: 4.1,
      isFavourite: true,
      ISBN :"4",
      author: "-",
      publication_date :"-",
      coverpage:"-",
      trade_price:"-",
      retail_price:"-",
      quantity: "44"
  ),
  Product(
      id: 10,
      images: [
        "assets/images/wireless headset.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      name: "Logitech Head",
      price: 20,
      description: description,
      rating: 4.1,
      isFavourite: true,
      ISBN :"4",
      author: "-",
      publication_date :"-",
      coverpage:"-",
      trade_price:"-",
      retail_price:"-",
      quantity: "44"
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

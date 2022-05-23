import 'package:flutter/material.dart';

import 'Product.dart';
import 'Product.dart';

class Cart {
  final Product product;
  final int numOfItem;
  final double totalPrice;

  Cart({required this.product, required this.numOfItem, required this.totalPrice });
}

// Demo data for our cart
List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItem: 2, totalPrice: demoProducts[0].price*2 ),
  Cart(product: demoProducts[1], numOfItem: 1, totalPrice: demoProducts[1].price*1),
  Cart(product: demoProducts[2], numOfItem: 5, totalPrice: demoProducts[2].price*5),
  Cart(product: demoProducts[3], numOfItem: 7, totalPrice: demoProducts[3].price*7),
];



///////////////////////////////

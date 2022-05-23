import 'package:flutter/material.dart';
import 'package:shopping_cart/components/product_card.dart';
import 'package:shopping_cart/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';


//////

//
class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(70)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(40)),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ...List.generate(
                demoProducts.length,
                    (index) {
                  return
                    ProductCard(product: demoProducts[index]);
                },
              ),
              SizedBox(height: getProportionateScreenWidth(70)),
              SizedBox(width: getProportionateScreenWidth(70)),
            ],
          ),
        )
      ],
    );
  }
}

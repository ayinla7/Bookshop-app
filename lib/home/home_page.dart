import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:shopping_cart/models/Product.dart';
import 'package:shopping_cart/components/product_card.dart';
import '../../../size_config.dart';
import 'package:shopping_cart/test.dart';

import 'package:shopping_cart/model/shopping.dart';
import 'package:shopping_cart/widgets/show_money.dart';
import 'package:shopping_cart/helper/data_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_cart/models/Product.dart';
import 'package:shopping_cart/screens/details/details_screen.dart';
import 'package:shopping_cart/stocklevel.dart';

import '../constants.dart';
import '../screens/home/components/discount_banner.dart';
import '../screens/home/components/home_header.dart';
import '../screens/home/components/popular_product.dart';
import '../screens/home/components/special_offers.dart';
import '../size_config.dart';
import 'package:shopping_cart/screens/cart/cart_screen.dart';
import 'package:shopping_cart/screens/home/components/icon_btn_with_counter.dart';
import '../screens/home/components/section_title.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return ListViewHomeLayout();
  }
}

class ListViewHomeLayout extends StatefulWidget {
  @override
  ListViewHome createState() {
    return new ListViewHome();
  }
}

class ListViewHome extends State<ListViewHomeLayout> {
  double width = 240;
  double aspectRetio = 1.02;

  // Future a = fetchAlbum();

  //Product product = demoProducts;

  late Future<Books> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFFFF4848),
            foregroundColor: Colors.white,
              shadowColor: Colors.white,
              title: Column(
                children: [
                  Text("                          HOME                  ",
                    style: TextStyle(color: Colors.white),

                  ),],
              ),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconBtnWithCounter(
                        svgSrc: "assets/icons/cart1.svg",
                        numOfitem: int.parse(DataHelper.cart_count()),

                        press: () {
                          if (DataHelper.allShoppingList.length > 0) {
                            Navigator.pushNamed(context, '/cart');
                          } else {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    AlertDialog(
                                        title: const Text('EMPTY CART!'),
                                        content: const Text(
                                            'Cart is empty, Kindly add items to cart to proceed!'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, 'OK');
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ]
                                    )
                            );
                          }
                        },
                      ),
                    ],
                  )
              )
            ]
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: getProportionateScreenWidth(2)),
                  DiscountBanner(),
                  SizedBox(height: getProportionateScreenWidth(2)),
                  Column(
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(70)),
                          child: SectionTitle(
                              title: "Available Books", press: () { }),
                        ),

                        ////Body
                      Center(
                      child: FutureBuilder<Books>(
                      future: futureBooks,
                      builder: (context, snapshot) {
                      if (snapshot.hasData) {

                        int range;
                        if(snapshot.data!.books.length > 10){
                          range = 10;
                        }else{
                          range = snapshot.data!.books.length;
                        }
                        int r;
                        for(r=0; r < snapshot.data!.books.length; r ++){
                          DataHelper.quantityList.add([snapshot.data!.books[r]["ISBN"], snapshot.data!.books[r]["retail_price"]]);
                        }

                        print(DataHelper.quantityList);


                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10)),
                          child: Column(
                              children: [
                                SizedBox(
                                    height: getProportionateScreenWidth(20)),
                                ...List.generate(

                                  //   demoProducts.length, (index) {
                                  range, (index) {
                                  //return ProductCard(product: demoProducts[index]);
                                  return Padding(
                                    //padding: EdgeInsets.all(getProportionateScreenWidth(30)),
                                    padding: EdgeInsets.only(
                                        right: 0,
                                        left: 0,
                                        bottom: 15.0,
                                        top: 15.0),
                                    child: SizedBox(
                                      width: getProportionateScreenWidth(width),
                                      child: GestureDetector(
                                        onTap: () =>
                                            Navigator.pushNamed(
                                              context,
                                              DetailsScreen.routeName,
                                              arguments: ProductDetailsArguments(
                                                  product: demoProducts[index]),
                                            ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            AspectRatio(
                                              aspectRatio: 1.02,
                                              child: Container(
                                                padding: EdgeInsets.all(
                                                    getProportionateScreenWidth(
                                                        20)),
                                                //padding: EdgeInsets.only(
                                                //    right: 5.0, left: 5.0, bottom: 2.0, top: 2.0),
                                                decoration: BoxDecoration(
                                                  color: kSecondaryColor
                                                      .withOpacity(0.1),
                                                  borderRadius: BorderRadius
                                                      .circular(15),
                                                ),
                                                child: Hero(
                                                  tag: demoProducts[index].id
                                                      .toString(),
                                                  // child: Image.asset(
                                                  //     demoProducts[index]
                                                  //         .images[0]),
                                                    child:  Image.network(
                                                      snapshot.data!.books[index]["coverpage"],
                                                      width: 280.0,
                                                    )
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              //demoProducts[index].name,
                                              snapshot.data!.books[index]["name"],
                                              style: TextStyle(
                                                  color: Colors.black),
                                              maxLines: 2,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
//                                                  "${DataHelper.currency()}${demoProducts[index].price}",
                                                  "${DataHelper.currency()}${snapshot.data!.books[index]["retail_price"]}",
                                                  style: TextStyle(
                                                    fontSize: getProportionateScreenWidth(
                                                        18),
                                                    fontWeight: FontWeight.w600,
                                                    color: kPrimaryColor,
                                                  ),
                                                ),
                                                InkWell(
                                                  borderRadius: BorderRadius
                                                      .circular(50),
                                                  onTap: () async {
                                                    setState(() {
                                                      // var addShopping = Shopping(
                                                      //     productName: demoProducts[index]
                                                      //         .name,
                                                      //     productPrice: demoProducts[index]
                                                      //         .price,
                                                      //     ISBN: demoProducts[index]
                                                      //         .ISBN,
                                                      //     productNumber: int
                                                      //         .parse("1"));

                                                      var addShopping = Shopping(
                                                          productName: snapshot.data!.books[index]["name"],
                                                          productPrice: double.parse(snapshot.data!.books[index]["retail_price"]),
                                                          ISBN: snapshot.data!.books[index]["ISBN"],
                                                          productNumber: int
                                                              .parse("1"));

                                                      print(addShopping
                                                          .productPrice);
                                                      print(addShopping
                                                          .productName);
                                                      print(addShopping.ISBN);
                                                      print(addShopping
                                                          .productNumber);

                                                      DataHelper.addShopping(
                                                          addShopping);
                                                      DataHelper.cart_count();
                                                      DataHelper
                                                          .get_listLenght();
                                                      DataHelper.cart_count();
                                                    });

                                                    ScaffoldMessenger.of(
                                                        context).showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                              snapshot.data!.books[index]["name"] +
                                                                  ' Added to Cart!'),
                                                        ));
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                        getProportionateScreenWidth(
                                                            8)),
                                                    height: getProportionateScreenWidth(
                                                        28),
                                                    width: getProportionateScreenWidth(
                                                        28),
                                                    decoration: BoxDecoration(
                                                      color: kPrimaryColor
                                                          .withOpacity(0.15),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      "assets/icons/add.svg",
                                                      color: Color(0xFFFF4848),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                ),
                              ]
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error loading up Page');
                      }
                      return const CircularProgressIndicator();
                      }
                      ),
                      ),
                      ]
                  ),
                  SizedBox(
                      height: getProportionateScreenWidth(70)),
                ]
            ),
          ),

        ),
      floatingActionButton: FloatingActionButton.extended(
      //backgroundColor: Colors.blue,
        backgroundColor: Color(0xFFFF4848),

        icon: Icon(Icons.receipt),
      label: Text('STOCK LEVEL'),
      onPressed: (){
        print("Hello");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StocklevelWidget()),
        );
      },
      tooltip: 'View Bookshop stock level!',
    ),
    );
  }



////////////Initial Home page, List///////////////////////

//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Books'),
//       actions: <Widget>[
//         Stack(
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.shopping_cart),
//               padding: EdgeInsets.only(top: 10),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/cart');
//               },
//             ),
//             Container(
//               height: 35,
//               padding: EdgeInsets.only(right: 20, top: 5),
//               alignment: Alignment.topRight,
//               child: Container(
//                 width: 20,
//                 height: 20,
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.all(2),
//                 //child: Text(DataHelper.cart_count()),
//                 child: ShowQuantity(
//                   Totalquantity: int.parse(DataHelper.cart_count()),
//                 ),
//                 decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.all(Radius.circular(10))),
//               ),
//             )
//           ],
//         )
//       ],
//     ),
//     body: Center(
//         child:
//         ListView.builder(
//             itemCount: titles.length,
//             itemBuilder: (context, index) {
//               return Card(
//                   child: ListTile(
//                     onTap: () async{
//                       //   setState(() {
//                       //     var addShopping = Shopping(
//                       //         productName: titles[index],
//                       //         productPrice: double.parse(price[index]),
//                       //         ISBN: ISBN[index],
//                       //         productNumber: int.parse("1"));
//                       //         DataHelper.addShopping(addShopping);
//                       //         //RefreshPage
//                       //         Navigator.pushAndRemoveUntil(
//                       //           context,
//                       //           MaterialPageRoute(builder: (context) => HomePage()),
//                       //               (Route<dynamic> route) => false,
//                       //         );
//                       //         //Navigator.of(context).push(new MaterialPageRoute(builder: (context) => HomePage())).whenComplete(() => {});
//                       //   });
//                       //
//                       //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       //     content: Text(titles[index] + ' Added to Cart!'),
//                       //   ));
//                     },
//                     title: Text(titles[index] + " - " + currency + price[index] ),
//                     subtitle: Text(ISBN[index]),
//                     leading: CircleAvatar(
//                         backgroundImage: NetworkImage(
//                             "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
//                     trailing: IconButton(
//                       icon: Icon(
//                         Icons.add,
//                         size: 34,
//                       ),
//                       onPressed: () async {
//                         setState(() {
//                           var addShopping = Shopping(
//                               productName: titles[index],
//                               productPrice: double.parse(price[index]),
//                               ISBN: ISBN[index],
//                               productNumber: int.parse("1"));
//                           DataHelper.addShopping(addShopping);
//                           DataHelper.cart_count();
//                           DataHelper.get_listLenght();
//                           DataHelper.cart_count();
//                         });
//
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           content: Text(titles[index] + ' Added to Cart!'),
//                         ));
//                       },
//                     ),
//                   ));
//             })
//     ),
//   );
// }
// }
//
//
//


//////////////One Line, HomePAge//////////
//
// @override
// Widget build(BuildContext context) {
//   SizeConfig().init(context);
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Books'),
//       actions: <Widget>[
//         Stack(
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.shopping_cart),
//               padding: EdgeInsets.only(top: 10),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/cart');
//               },
//             ),
//             Container(
//               height: 35,
//               padding: EdgeInsets.only(right: 20, top: 5),
//               alignment: Alignment.topRight,
//               child: Container(
//                 width: 20,
//                 height: 20,
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.all(2),
//                 //child: Text(DataHelper.cart_count()),
//                 child: ShowQuantity(
//                   Totalquantity: int.parse(DataHelper.cart_count()),
//                 ),
//                 decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.all(Radius.circular(10))),
//               ),
//             )
//           ],
//         )
//       ],
//     ),
//     body: SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
//       child: Column(
//           children: [
//             SizedBox(height: getProportionateScreenWidth(20)),
//             ...List.generate(
//               demoProducts.length, (index) {
//               return ProductCard(product: demoProducts[index]);
//             },
//             ),
//             SizedBox(height: getProportionateScreenWidth(70)),
//           ]
//       ),
//     ),
//   );
// }
// }
//


//*******Width*******
///////////Width
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Books'),
//           actions: <Widget>[
//             Stack(
//               children: <Widget>[
//                 IconButton(
//                   icon: Icon(Icons.shopping_cart),
//                   padding: EdgeInsets.only(top: 10),
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/cart');
//                   },
//                 ),
//                 Container(
//                   height: 35,
//                   padding: EdgeInsets.only(right: 20, top: 5),
//                   alignment: Alignment.topRight,
//                   child: Container(
//                     width: 20,
//                     height: 20,
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.all(1),
//                     //child: Text(DataHelper.cart_count()),
//                     child: ShowQuantity(
//                       Totalquantity: int.parse(DataHelper.cart_count()),
//                     ),
//                     decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       body: GridView.count(
//           //padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(30)),
//           padding: EdgeInsets.only(
//               right: 5.0, left: 5.0, bottom: 2.0, top: 2.0),
//           crossAxisCount: 2,
//           children: [
//           ...List.generate(
//           demoProducts.length, (index) {
//           return ProductCard(product: demoProducts[index]);
//           },
//           ),
//           SizedBox(height: getProportionateScreenWidth(70)),
//         ]
//       ),
//     );
//   }
// }
}
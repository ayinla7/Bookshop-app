import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart/home/home_page.dart';
import 'package:shopping_cart/routes.dart';
import 'package:shopping_cart/test.dart';
import 'package:shopping_cart/theme.dart';
import 'package:shopping_cart/Country.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: HomePage(),

      //home: LoginSuccessScreen(),
      // We use routeName so that we dont need to remember the name
      //initialRoute: SplashScreen.routeName,
      routes: routes,

    );
  }
}


//////////////////////////////////////////////////////////
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Shopping Cart Page',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: ColorConstants.mainColor,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       routes: {
//         //'/': (BuildContext context) => AuthPage(),
//         '/home': (BuildContext context) => HomePage(),
//         //'/admin': (BuildContext context) => ProductAdmin(),
//         '/cart': (BuildContext context) => ShoppingCartPage()
//       },
//       // home: const ShoppingCartPage(),
//       home: StocklevelWidget(),
//       // home: HomePage(),
//     );
//   }
// }
//
// class FirstRoute extends StatelessWidget {
//   const FirstRoute({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('First Route'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Open route'),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ListViewHomeLayout()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            //Currency("Canada").then((result) => print(result));
            getCurrencycode2(37.4219983, -122.084);
          },
          child: Text("hii"),
        ),
      ),
    );
  }

  String getCurrencycode2(double lat, double lon) {
    String Currencycode = "";
    fetchCountries(lat, lon).then((Countries result) =>
        Currency(result.countryname).then((result2) {
          Currencycode = result2;
          print(Currencycode);
        })
    );
    return Currencycode;
  }

// // class ListViewHomeLayout extends StatefulWidget {
// //   @override
// //   ListViewHome createState() {
// //     return new ListViewHome();
// //   }
// // }
// // class ListViewHome extends State<ListViewHomeLayout> {
// //   List<String> titles = ["List 1", "List 2", "List 3"];
// //   final subtitles = [
// //     "Here is list 1 subtitle",
// //     "Here is list 2 subtitle",
// //     "Here is list 3 subtitle"
// //   ];
// //   final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];
// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //         itemCount: titles.length,
// //         itemBuilder: (context, index) {
// //           return Card(
// //               child: ListTile(
// //                   onTap: () {
// //                     setState(() {
// //                       titles.add('List' + (titles.length+1).toString());
// //                       subtitles.add('Here is list' + (titles.length+1).toString() + ' subtitle');
// //                       icons.add(Icons.zoom_out_sharp);
// //                     });
// //                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //                       content: Text(titles[index] + ' pressed!'),
// //                     ));
// //                   },
// //                   title: Text(titles[index]),
// //                   subtitle: Text(subtitles[index]),
// //                   leading: CircleAvatar(
// //                       backgroundImage: NetworkImage(
// //                           "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
// //                   trailing: Icon(icons[index])));
// //         });
// //   }
// // }

}

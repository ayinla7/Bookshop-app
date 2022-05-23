import 'package:flutter/material.dart';
import 'package:shopping_cart/thankyou.dart';


class Paymentgw extends StatelessWidget {
  const Paymentgw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body:  MyExample(),
      ),
    );
  }
}
Color textColor = const Color(0xFF32567A);

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),


      ],
    );
  }
}



class MyExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Example')),
        body: new Center(
          child: new Builder(builder: (context) {
            return new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  onPressed: () => modal(context),
                  child: new Text("modal"),
                ),
                new RaisedButton(
                  onPressed: () => showSlideupView(context),
                  child: new Text("non modal"),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  void showSlideupView(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            child: new GestureDetector(
              onTap: () => Navigator.pop(context),
              child: new Text("Click me to close this non-modal bottom sheet"),
            ),
          );
        });
  }

  modal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context)
    {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                height: 70,
                padding: EdgeInsets.only(
                    left: 0.0, top: 20.0, right: 0.0, bottom: 10.0),
                child: Image.asset(
                  "assets/images/visa.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 3),
              child: Center(
                child: Text("PAYMENT",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.blue),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Card number',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'CVV',
                        ),
                      ),),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Expanded( // wrap your Column in Expanded
                  child: Column(
                    children: <Widget>[
                      Container(child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Expiry date',
                        ),
                      ),),
                    ],
                  ),
                ),
                SizedBox(width: 30),
              ],
            ),

            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThankYouPage(),
                    )
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Center(
                  child: Text(
                    'Pay',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            ),
          ]
      );
    });
  }
}



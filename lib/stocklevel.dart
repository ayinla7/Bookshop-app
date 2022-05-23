import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/Addstockpage.dart';
import 'package:shopping_cart/models/Product.dart';
import 'package:shopping_cart/test.dart';


class StocklevelWidget extends StatefulWidget {
  const StocklevelWidget({Key? key}) : super(key: key);
  @override
  _StocklevelWidget createState() => _StocklevelWidget();
}

class _StocklevelWidget extends State<StocklevelWidget> {
////////////Initial Home page, List///////////////////////

  late Future<Books> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = fetchBooks();
  }
  String currency = "#";
  List<String> titles = ["Book Name 1", "Book Name 2", "Book Name 3", "Book Name 4"];
  final ISBN = ["ISBN1", "ISBN2", "ISBN3", "ISBN4",];
  final price = ["100", "200", "300", "400",];

  @override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
      backgroundColor: Color(0xFFFF4848),
        title: Column(
      children: const [
      Text("STOCK LEVEL",
      style: TextStyle(color: Colors.white),
      ),
      ],
        ),
      ),
    body: Center(
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
            return Center(
        child:
        ListView.builder(
            itemCount: range,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                    title: Text(snapshot.data!.books[index]["name"]),
                    subtitle: Text(snapshot.data!.books[index]["ISBN"]),
                    leading: Image.network(
                      snapshot.data!.books[index]["coverpage"],
                      width: 100.0,
                      height:80
                    ),
                    trailing:
                      Text("Qty: "+snapshot.data!.books[index]["quantity"]),
                  ));
            })
    );
          } else if (snapshot.hasError) {
            return Text('Error loading up Page');
          }
          return const CircularProgressIndicator();
          },
      ),
    ),
   floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFFFF4848),
        icon: Icon(Icons.add),
        label: Text('ADD NEW BOOK'),
        onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddStockPage()),
            );
          },
        tooltip: 'ADD NEW BOOK!',
      )
  );
}
}




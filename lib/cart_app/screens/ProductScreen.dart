import 'dart:convert';

import 'package:flutter/material.dart';
import 'ProductModel.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  final ValueSetter<User1> _valueSetter;

  ProductScreen(this._valueSetter);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Future<List<User1>> getRequest() async {
    //replace your restFull API here.
    String url =
        "https://anthracitic-pecks.000webhostapp.com/scan_copy/Customer/Cart_Display.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User1> users = [];
    for (var singleUser in responseData) {
      User1 user = User1(
        id:singleUser["id"],
        productname: singleUser["productname"],
        // productprice: int.parse(singleUser["productprice"]) ,
        // productqty: int.parse(singleUser["productqty"]),
        productprice:singleUser["productprice"] as dynamic,
        productqty: singleUser["productqty"]as dynamic,

      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: FutureBuilder(
          future: getRequest(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.red.shade900,
                        strokeWidth: 5,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Data Loading Please wait",
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(snapshot.data[index].productname),
                    // title: Text(products[index].name),
                    trailing: Text(
                      "\$${(snapshot.data[index].productprice)}",
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      "\$${snapshot.data[index].productqty}",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      widget._valueSetter(snapshot.data[index]);
                    },
                  );
                },
              );
            }
          }),
    );
  }
}

import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

//Creating a class user to store the data;
class User {
  final String id;
  final String productid;
  final String productname;
  final String productprice;
  final String productqty;
  final String image;

  User({
    required this.id,
    required this.productid,
    required this.productname,
    required this.productprice,
    required this.productqty,
    required this.image,
  });
}

class Viewcart extends StatefulWidget {
  @override
  _ViewcartState createState() => _ViewcartState();
}

class _ViewcartState extends State<Viewcart> {
  num subTotal = 0;

  //Applying get request.
  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    String url =
        "https://anthracitic-pecks.000webhostapp.com/scan_copy/Customer/Cart_Display.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
        id: singleUser["id"].toString(),
        productid: singleUser["productid"].toString(),
        productname: singleUser["productname"].toString(),
        productprice: singleUser["productprice"].toString(),
        productqty: singleUser["productqty"].toString(),
        image: singleUser["image"].toString(),
      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade200,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: GoogleFonts.prompt(fontSize: 22),
        ),
      ),
      body: Container(
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
                    return Column(
                      children: [
                        Card(
                            shadowColor: Colors.red,
                            elevation: 8,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              // color: Colors.red,
                              height: 130,
                              width: 400,
                              padding: EdgeInsets.fromLTRB(10, 15, 50, 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      snapshot.data[index].image,
                                      height: 100,
                                      width: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name : " +
                                            snapshot.data[index].productname,
                                      ),
                                      Text(
                                        "Price : " +
                                            snapshot.data[index].productprice,
                                      ),
                                      Text(
                                        "Qty : " +
                                            snapshot.data[index].productqty,
                                      ),
                                      //  Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Remove",
                                            style: GoogleFonts.aBeeZee(
                                                color: Colors.red.shade900),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  delrecord(
                                                      snapshot.data[index].id);
                                                });
                                              },
                                              icon: Icon(Icons.clear,
                                                  size: 20,
                                                  color: Colors.red.shade900)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 20, bottom: 20, left: 20),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.arrow_forward_ios)))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  });
            }
          },
        ),
      ),
    );
  }

  Future<void> delrecord(String id) async {
    String url =
        "https://anthracitic-pecks.000webhostapp.com/scan_copy/Customer/CartDelete.php";
    var res = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    var resoponse = jsonDecode(res.body);
    if (resoponse["success"] == "true") {
      print("record deleted");
      // setState(() {
      getRequest();
      // });

    } else {
      print("some issue");
    }
  }
}

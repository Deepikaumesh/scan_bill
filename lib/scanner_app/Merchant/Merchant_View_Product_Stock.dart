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
  final String stock;

  User({
    required this.id,
    required this.productid,
    required this.productname,
    required this.productprice,
    required this.productqty,
    required this.image,
    required this.stock,
  });
}

class Merchant_View_Product_stock extends StatefulWidget {
  @override
  _Merchant_View_Product_stockState createState() => _Merchant_View_Product_stockState();
}

class _Merchant_View_Product_stockState extends State<Merchant_View_Product_stock> {


  //Applying get request.
  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    String url =
        "https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/Merchant_View_Product_Stock.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
        id: singleUser["id"],
        productid: singleUser["productid"],
        productname: singleUser["productname"],
        // productprice: singleUser["productprice"].toString(),
        // productqty: singleUser["productqty"].toString(),
        productprice: singleUser["productprice"],
        productqty: singleUser["productqty"],
        stock: singleUser["stock"],


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
          "Product Stock",
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


                 //   var items = snapshot.data as List<User>;
                    // print( items.map((e) => int.parse(e.product*e.productprice))
                    // print(items.map((e) =>double.parse(e.productqty + 3)));





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
                              height: 150,
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
                                        "Product Id : " +
                                            snapshot.data[index].productid,
                                        style: TextStyle(color: Colors.red.shade600),
                                      ),
                                      Text(
                                        "Name : " +
                                            snapshot.data[index].productname,
                                      ),


                                      Text(
                                        "Price : " +
                                            snapshot.data[index].productprice,
                                      ),
                                      Text(
                                        "Productstock : " +
                                            snapshot.data[index].stock,
                                      ),
                                      // Text(
                                      //   "Qty : " +
                                      //       snapshot.data[index].productqty,
                                      // ),
                                      // Text(
                                      //   "SubTotal : " +
                                      //       snapshot.data[index].productqty +  snapshot.data[index].productprice),




                                      //     Text("Sub Total : "+ (snapshot.data[index].productprice * snapshot.data[index].productqty)),


                                      Row(
                                        // mainAxisAlignment:
                                        // MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Delete Product",
                                            style: GoogleFonts.aBeeZee(
                                                color: Colors.red.shade900,fontSize: 12),
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 30),
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
        "https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/Merchant_Delete_Stock_Product.php";
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
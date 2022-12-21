import 'dart:convert';
import 'dart:ffi';
import 'package:ecommerce_scan_andbill_app/scanner_app/Customer/Customer_Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../Merchant/Merchant_Payment.dart';
import '../Merchant/Merchant_Update_With_BottomSheet.dart';

//Creating a class user to store the data;
class User {
  final String id;
  final String productid;
  final String productname;
  final String productprice;
  //final String productqty;
  final String image;
  final String stock;
  final String cid;
  final String product_qty;



  User({
    required this.id,
    required this.productid,
    required this.productname,
    required this.productprice,
   // required this.productqty,
    required this.image,
    required this.stock,
    required this.cid,
    required this.product_qty,
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
        "https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/Merchant_cust_join_cartDisplay.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
        product_qty: singleUser["product_qty"].toString(),
        cid: singleUser["cartid"].toString(),
        id: singleUser["id"].toString(),
        productid: singleUser["productid"].toString(),
        productname: singleUser["productname"].toString(),
        productprice: singleUser["productprice"].toString(),
       // productqty: singleUser["productqty"].toString(),
        image: singleUser["image"].toString(),
        stock: singleUser["stock"].toString(),
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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.red.shade200,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: GoogleFonts.prompt(fontSize: 22),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink.shade500,
        child: TextButton(
           onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Merchant_Payment_Page()));
           }, child: Text("Buy",style: TextStyle(color: Colors.white),),
        )

      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children:[ FutureBuilder(
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
                List<User> _user = snapshot.data;
                return
                  Flexible(
                    child: Column(
                      children: [
                       // Text("hai"),
                    Flexible(
                      child: ListView.builder(
                       // scrollDirection: Axis.vertical,
                         shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, index) {
                            return
                              Column(
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
                                      height:
                                          MediaQuery.of(context).size.height / 5,
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.fromLTRB(10, 15, 50, 15),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                                                    snapshot
                                                        .data[index].productname,
                                              ),
                                              Text(
                                                "Price : " +
                                                    snapshot
                                                        .data[index].productprice,
                                              ),

                                              // Text(
                                              //   "Product Qty : " +
                                              //       snapshot
                                              //           .data[index].productqty,
                                              // ),
                                              Text(
                                                "Product Qty : " +
                                                    snapshot
                                                        .data[index].product_qty,
                                              ),
                                              Text(
                                                "Sub Total : " +
                                                    ProductCalculations
                                                        .getTotalRateFromString(
                                                            productPrice: snapshot
                                                                .data[index]
                                                                .productprice,
                                                            Quantity: snapshot
                                                                .data[index]
                                                                .product_qty),
                                              ),

                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Remove",
                                                    style: GoogleFonts.aBeeZee(
                                                        color:
                                                            Colors.red.shade900),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewcart_customer()));
                                                        setState(() {
                                                          delrecord(snapshot
                                                              .data[index].cid);
                                                        });
                                                      },
                                                      icon: Icon(Icons.clear,
                                                          size: 20,
                                                          color: Colors
                                                              .red.shade900)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 20, bottom: 20, left: 20),

                                              child: IconButton(
                                                  onPressed: () {
                                                    showModalBottomSheet(context: context, builder: (context) =>
                                                            Merchant_Update_Bottomsheet(
                                                              data_user: snapshot
                                                                  .data[index],
                                                            ));
                                                  },
                                                  icon: Icon(
                                                      Icons.arrow_forward_ios)))
                                        ],
                                      ),
                                    ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          }),
                    ),




      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 50,
                          color: Colors.pink.shade50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                              Text(
                                "\$${returnTotalAmount(_user)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                            ],
                          ),
                        )),
                ],),
                  );
              }
            },
          ),
      ],
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
      print(id);
      // setState(() {
      getRequest();
      // });

    } else {
      print("some issue");
    }
  }

  String returnTotalAmount(List<User> _user) {
    double totalAmount = 0.0;
    for (int i = 0; i < _user.length; i++) {
      totalAmount = totalAmount +
          (double.parse(_user[i].productprice) *
              double.parse(_user[i].product_qty));
    }
    return totalAmount.toString();
  }



}

class ProductCalculations {
  static String getTotalRateFromString(
      {required String productPrice, required String Quantity}) {
    String rate = "";
    double _Quantity = double.parse(Quantity);
    double _productPrice = double.parse(productPrice);

    double totalAmount = _Quantity * _productPrice;
    rate = totalAmount.toInt().ceil().toString();

    return rate;
  }
}

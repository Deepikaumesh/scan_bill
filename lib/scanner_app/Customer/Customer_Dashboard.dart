import 'dart:convert';
import 'package:ecommerce_scan_andbill_app/Reserved_Files/view_crt.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../Scanner_main_way.dart';
import 'Customer_Login.dart';
import 'ViewCart.dart';

class Customer_Dashboard extends StatefulWidget {
  @override
  _Customer_DashboardState createState() => _Customer_DashboardState();
}

class _Customer_DashboardState extends State<Customer_Dashboard> {
  TextEditingController textcontroller = TextEditingController();

  late bool status;
  late String message = "";

  var getResult = '';

  @override
  void initState() {
    textcontroller = TextEditingController();

    status = false;
    message = "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
            },
            icon: Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.amber.shade300,
          title: Center(
            child: Text(
              "Dashboard",
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Customer_Signout(context);
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        // drawer: Drawer(
        //   child: MainDrawer(),
        // ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width / 1.4,
                decoration: BoxDecoration(
                  //  border: Border.all(),
                  // borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: AssetImage('assets/images/qr.png'),
                    //  fit: BoxFit.contain,
                  ),
                  //  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.cyan,
                  padding:
                      EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15),
                ),
                onPressed: () {
                  scanQRCode();
                },
                child: Text('Scan QR'),
              ),
              SizedBox(
                height: 5,
              ),
              //  Text(getResult),
              Padding(
                padding: EdgeInsets.all(40),
                child: TextFormField(
                  controller: textcontroller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "QR Code Result",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.red.shade900,
                        padding: EdgeInsets.only(
                            left: 40, right: 40, top: 15, bottom: 15),
                      ),
                      onPressed: () {
                        setState(() {
                          send_scan_value();
                        });
                        print("Successful");
                        textcontroller.clear();
                      },
                      child: Text("Add To Cart")),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.red.shade900,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              Text(
                status ? message : message,
                style: GoogleFonts.lato(
                    fontSize: 12,
                    color: Colors.red.shade900,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Get_Data()));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Viewcart()));
                    },
                    child: Text("View Cart"),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.red.shade900,
                      padding: EdgeInsets.only(
                          left: 50, right: 50, top: 15, bottom: 15),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.red.shade900,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IconButton(
                  //     onPressed: () {
                  //      showModalBottomSheet(
                  //      //  enableDrag: false,//cannot drag close
                  //        //isDismissible: false,// disable click anywhere to close
                  //        shape: RoundedRectangleBorder(
                  //          borderRadius: BorderRadius.vertical(
                  //            top: Radius.circular(30),
                  //          )
                  //        ),
                  //
                  //        context: context,
                  //          builder: (context)=>buildSheet(data_user:),
                  //      );
                  //     },
                  //     icon: Icon(
                  //       Icons.message,
                  //       color: Colors.red.shade900,
                  //     )),
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => update_test_view()));
                  //     },
                  //     icon: Icon(
                  //       Icons.arrow_downward,
                  //       color: Colors.red.shade900,
                  //     )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(qrCode);
      textcontroller.text = qrCode;
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }

  Customer_Signout(BuildContext ctx) async //using navigator so we need context
  {
    final _CustomersharedPrefs = await SharedPreferences.getInstance();
    await _CustomersharedPrefs.clear();
    //push new page and remove all other pages

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctx1) => Customer_Login()),
        (route) => false);
  }

  Future send_scan_value() async {
    //  var APIURL = "https://anthracitic-pecks.000webhostapp.com/product.php"; //000webhost ip address
    var APIURL =
        "https://anthracitic-pecks.000webhostapp.com/scan_copy/Customer/Cart_Product.php";

    //json maping user entered details
    Map mapeddate = {
      'productid': textcontroller.text,
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL), body: mapeddate);

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    var responseMessage = data["message"];
    var responseError = data["error"];
    print("DATA: ${data}");
    if (responseError) {
      setState(() {
        status = false;
        message = responseMessage;
      });
    } else {
      textcontroller.clear();

      setState(() {
        status = true;
        message = responseMessage;
      });
    }
  }
  //Current user
//Future getData() async {
//     var url = 'https://azer.maverus.ba/api/read.php';
//     var response = await http.get(Uri.parse(url),headers: <String, String>{
//       "Authorization" : "YOUR KEY HERE"
//     });
//     return json.decode(response.body);
//   }







  // Widget buildSheet() {
  //   return Column(
  //     //mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Container(
  //         padding: EdgeInsets.all(10),
  //
  //       ),
  //       Text("hello"),
  //       Text("hello"),
  //       Text("hello"),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children:[
  //         ElevatedButton(onPressed: (){}, child: Text("submit")),
  //         ElevatedButton(onPressed: (){
  //           Navigator.pop(context);
  //         }, child: Text("cancel")),
  //   ],),
  //
  //     ],
  //
  //
  //   );
  // }
}



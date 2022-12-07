import 'dart:convert';
import 'dart:math';

import 'package:ecommerce_scan_andbill_app/scanner_app/Customer/Customer_Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../Customer/ViewCart.dart';

class Update_Merchant extends StatefulWidget {
  final User use;

  Update_Merchant({required this.use});

  @override
  _Update_MerchantState createState() => _Update_MerchantState();
}

class _Update_MerchantState extends State<Update_Merchant> {
  TextEditingController pid = TextEditingController();
  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pqty = TextEditingController();
  TextEditingController pstok = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  setUp() {
    pid = TextEditingController(text: widget.use.productid);
    pname = TextEditingController(text: widget.use.productname);
    pprice = TextEditingController(text: widget.use.productprice);
    pqty = TextEditingController(text: widget.use.productqty);
    pstok = TextEditingController(text: widget.use.stock);
  }

  check() {
    final form = _formkey.currentState;
    if (form!.validate()) {
      form.save();
      submit();
    } else {}
  }

  submit() async {
    final response = await http.post(
        Uri.parse(
            "https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/Update_productqty.php"),
        body: {
          "id": widget.use.id.toString(),
          "productid": pid.text,
          "productname": pname.text,
          "productprice": pprice.text,
          "productqty": pqty.text,
          "stock": pstok.text,
        });
    //  final data = jsonDecode(response.body);
    //   if (response.statusCode == 200) {
    //     final snackBar = await SnackBar(
    //       content: const Text('Product Updated Successfully!'),
    //       action: SnackBarAction(
    //         label: 'Ok Proceed',
    //         onPressed: () {
    //           Viewcart();
    //           // Some code to undo the change.
    //         },
    //
    //       ),
    //
    //
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //
    //
    //   } else {
    //     print('Not updated');
    //   }
    //   setState(() {});
  }

  @override
  void initState() {
    // pname = TextEditingController(text: widget.use.productname.toString());
    // pprice = TextEditingController(text: widget.use.productprice.toString());
    // pqty = TextEditingController(text: widget.use.productqty.toString());
    setUp();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber.shade300,
          title: Center(
            child: Text(
              "Product Registration",
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: TextFormField(
                  controller: pname,
                  //  keyboardType: TextInputType.text,
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
                      hintText: "Please enter product name",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextFormField(
                  controller: pprice,
                  //  keyboardType: TextInputType.number,
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
                      hintText: "Please enter poduct price",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: TextFormField(
                  controller: pqty,
                  // keyboardType:
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
                      label: Text("Product Quantity"),
                      hintText: "product qty",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.arrow_drop_up,
                  size: 25.0,
                ),
                onTap: () {
                  int currentValue = int.parse(pqty.text);
                  setState(() {
                    currentValue++;
                    pqty.text = (currentValue).toString();
                  });
                },
              ),
              InkWell(
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 25.0,
                ),
                onTap: () {
                  int currentValue = int.parse(pqty.text);
                  setState(() {
                    currentValue--;
                    pqty.text =
                        (currentValue > 0 ? currentValue : 1).toString();
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    submit();
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            title: Text("Change Product Quantity"),
                            content: Text(
                                "Are you sure want to change the Product  quantity?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Viewcart()));
                                  },
                                  child: Text("ok")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("cancel")),
                            ],
                          );
                        });
                  },
                  child: Text("Submit"),
                ),
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Cancel"))
      ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

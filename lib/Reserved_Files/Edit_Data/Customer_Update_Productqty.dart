import 'dart:convert';

import 'package:ecommerce_scan_andbill_app/scanner_app/Customer/ViewCart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


class Update_Product_Qty extends StatefulWidget {
  final String p0;
   final String p1;
   final String p2;
   final String p3;
  final String p4;
  final String p5;

  Update_Product_Qty({required this.p0,required this.p1,required this.p2,required this.p3,required this.p4,required this.p5});

  @override
  _Update_Product_QtyState createState() => new _Update_Product_QtyState();
}

class _Update_Product_QtyState extends State<Update_Product_Qty> {
  TextEditingController productid = TextEditingController();
  TextEditingController productname = TextEditingController();
  TextEditingController productprice = TextEditingController();
  TextEditingController productqty = TextEditingController();
  TextEditingController stock = TextEditingController();

  Future  UpdateData()  async{
    var url ="https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/Update_productqty.php";
    await http.post(Uri.parse(url),
        body: {
          "productid":widget.p0.toString(),
          "Productname": productname.text,
          "Productprice": productprice.text,
          "Productname": productname.text,
          "stock": widget.p4,
          "image": widget.p5,
        });
    //  var response = jsonDecode(res.body);
    // if(response["msg"]=='uccessfully Edited..'){
    //   print("updated");
    // }
    // else{
    //   print("not");
    // }
  }
  void _onConfirm(context) async {
    await UpdateData();
  }




  @override
  void initState(){
    productid.text=widget.p0;
    productname.text =widget.p1;
    productprice.text=widget.p2;
    productqty.text=widget.p3;
    stock.text=widget.p4;

    super.initState();
  }




  // void UpdateData() {
  //   try {
  //     var url = "https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/Update_productqty.php";
  //
  //     http.post(Uri.parse(url),
  //         body: {
  //           "productid":widget.p0,
  //           "Productname": productname.text,
  //           "Productprice": productprice.text,
  //           "Productname": productname.text,
  //           "stock": widget.p4,
  //           "image": widget.p5,
  //
  //
  //         });
  //
  //   }catch(e){
  //
  //   }
  // }

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EDIT DATA",
          style: GoogleFonts.prompt(color: Colors.red.shade900),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.red.shade900,
            size: 35,// add custom icons also
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          child: Text('CONFIRM'),
          onPressed: () {
            _onConfirm(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewcart()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: productid,
                  decoration: new InputDecoration(
                      hintText: "productid", labelText: "Productid"),
                ),
                new TextField(
                  controller: productname,
                  decoration: new InputDecoration(
                      hintText: "Productname", labelText: "Productname"),
                ),
                new TextField(
                  // maxLines: 10,
                  controller: productprice,
                  decoration: new InputDecoration(
                      hintText: "productprice", labelText: "productprice"),
                ),
                new TextField(
                  maxLines: 6,
                  controller: productqty,
                  decoration: new InputDecoration(
                      hintText: "productqty", labelText: "productqty"),
                ),
                new TextField(
                  maxLines: 6,
                  controller: stock,
                  decoration: new InputDecoration(
                      hintText: "stock", labelText: "stock"),
                ),
                // ClipRRect(
                //   borderRadius:
                //   BorderRadius.circular(8.0),
                //   child: Image.network(
                //     widget.p5,
                //     height: 100,
                //     width: 100.0,
                //     fit: BoxFit.cover,
                //   ),
                // ),

                //
                // new ElevatedButton(
                //   child: new Text("Submit",style: TextStyle(color: Colors.white),),
                //   //color: Colors.red.shade900,
                //   onPressed: () {
                //     UpdateData();
                //    Navigator.pop(context);
                //     Navigator.of(context).push(
                //         new MaterialPageRoute(
                //             builder: (BuildContext context)=>Viewcart()));
                //   },
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

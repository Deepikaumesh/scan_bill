import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CheckoutScreen.dart';
import 'ProductModel.dart';
import 'ProductScreen.dart';

class CartApp extends StatefulWidget {
  @override
  _CartAppState createState() => _CartAppState();
}

class _CartAppState extends State<CartApp> {
  List<User1>  cart1 = [];
dynamic sum = int.parse('0');
  dynamic total =int.parse('0') ;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart App"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Products",
              ),
              Tab(
                text: "Checkout",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductScreen((selectedProduct) {
              setState(() {
                cart1.add(selectedProduct); //update
                cart1.forEach((item) {
                 sum = sum+item.productprice;
                //   sum = sum + item.productprice * item.productqty;
                //  sum = sum + (double.parse(item.productprice*double.parse(item.productqty)));
                  //totalAmount = totalAmount + (double.parse(_employee[i].productprice)*double.parse(_employee[i].productqty));
                });
              });
            }),
            CheckoutScreen(cart1, sum, total),
          ],
        ),
      ),
    );
  }
}

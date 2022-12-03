import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Merchant_Login.dart';
import 'Merchant_Product_Registration.dart';
import 'Merchant_View_Product_Stock.dart';

class Merchant_Dashboard extends StatefulWidget {
  @override
  _Merchant_DashboardState createState() => _Merchant_DashboardState();
}

class _Merchant_DashboardState extends State<Merchant_Dashboard> {
  signout(BuildContext ctx) async //using navigator so we need context
  {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    //push new page and remove all other pages

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctx1) => Merchant_Login()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //for hiding default back arrow
        backgroundColor: Colors.amber.shade300,
        title: Center(
          child: Text(
            "Dashboard",
          ),
        ),

        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 70),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.cyan,
                  padding:
                      EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Merchant_Product_Registration()));
                },
                child: Text('Product Registration'),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 70),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.red.shade200,
                  padding:
                  EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Merchant_View_Product_stock()));
                },
                child: Text('View Product Stock'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

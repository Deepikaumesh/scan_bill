
import 'package:ecommerce_scan_andbill_app/scanner_app/Scanner_main_way.dart';
import 'package:flutter/material.dart';

const Merchant_Key = "MerchantLoggedIn";
//String Customer_Key = "CustomerLoggedIn";
var uid_key = '';
var access_total_amt ='';
var uid_user ='';


final subTotal = 0;
//var ip_address = '192.168.29.64';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: WelcomeScreen(),
    );
  }
}


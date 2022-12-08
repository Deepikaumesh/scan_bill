import 'package:ecommerce_scan_andbill_app/scanner_app/Scanner_main_way.dart';
import 'package:flutter/material.dart';

const Merchant_Key = "MerchantLoggedIn";
const Customer_Key = "CustomerLoggedIn";

final subTotal = 0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: WelcomeScreen(),
    );
  }
}


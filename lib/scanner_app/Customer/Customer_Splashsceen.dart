import 'dart:async';
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import 'Customer_Login.dart';
import 'Customer_Dashboard.dart';




class Customer_Splashscreen extends StatefulWidget {
  _Customer_SplashscreenState createState() => _Customer_SplashscreenState();
}

class _Customer_SplashscreenState extends State<Customer_Splashscreen> {
  void initState() {
    checkUserLoogedIn();
    super.initState();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,


      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "welcome",
            style: GoogleFonts.aclonica(
              color: Colors.red.shade900,
              fontSize: 11.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],


      ),
    );
  }
  Future gotiLogin() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Customer_Login()));
  }


  Future<void> checkUserLoogedIn() async{
    final _sharedPrefs =await SharedPreferences.getInstance();
    print(SAVE_KEY_NAME);
    final _userLoggedIn=_sharedPrefs.getBool(SAVE_KEY_NAME);
    if(_userLoggedIn == null || _userLoggedIn == false){
      gotiLogin();
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Customer_Dashboard()));
    }

  }


}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

import 'Customer_Dashboard.dart';
import 'Customer_Registration.dart';

class Customer_Login extends StatefulWidget {
  const Customer_Login({Key? key}) : super(key: key);

  @override
  _Customer_LoginState createState() => _Customer_LoginState();
}

class _Customer_LoginState extends State<Customer_Login> {
  TextEditingController Cust_user = TextEditingController();
  TextEditingController Cust_pass = TextEditingController();
  final GlobalKey<FormState> Cust_formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/log.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Form(
                        key: Cust_formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: Cust_user,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter username";
                                }
                                return null;
                              },
                              onSaved: (name) {},
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Username",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: Cust_pass,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter password";
                                }
                                return null;
                              },
                              onSaved: (name) {},
                              style: TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          // login();
                                        });
                                        Cust_Login();

                                        if (Cust_formkey.currentState!.validate()) {
                                          print("Successfully  logged");
                                          Cust_user.clear();
                                          Cust_pass.clear();
                                        }
                                      }),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // Navigator.pushNamed(context, 'register');
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyRegister()));
                                  },
                                  child: Text(
                                    'Does not have an account?',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        // decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18),
                                  ),
                                  style: ButtonStyle(),
                                ),
                                TextButton(
                                    onPressed: () {
                                      // Navigator.pushNamed(context, 'register');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Customer_Registration()));
                                    },
                                    child: Text(
                                      //  'Forgot Password',
                                      'Sign Up',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18,
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future Cust_Login() async {
    var url =
        "https://anthracitic-pecks.000webhostapp.com/scan_copy/Customer/login.php"; //intego wifi password
    var response = await http.post(Uri.parse(url),
        headers: {
      'Accept':'application/json'
        },

        body: {
      "username": Cust_user.text,
      "password": Cust_pass.text,
    });
    var data = json.decode(response.body);
    // if (data.toString() == "Success") {
    if (data!=null) {
      //var responseData = json.decode(response.body);

      //Creating a list to store input data;
      for (var singleUser in data) {
        // await  SessionManager().set('token', user.text);
         print(singleUser["id"]);
         final _CustomersharedPrefs = await SharedPreferences.getInstance();
         // await _CustomersharedPrefs.setBool(Customer_Key, true);
         await _CustomersharedPrefs.setString("userid", singleUser["id"]);
        // print(response);
        //Customer_Key=singleUser["id"];
         //print("key:"+Customer_Key);
      }

      final snackBar = SnackBar(
        content: Text('Login Successfull'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // final _CustomersharedPrefs = await SharedPreferences.getInstance();
      // // await _CustomersharedPrefs.setBool(Customer_Key, true);
      // await _CustomersharedPrefs.setInt("userid", data["id"]);


      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Customer_Dashboard()));
      print("username:");
     // Customer_Key=data["id"];
      //print(data["id"]);
     // print(Customer_Key);
     // print(data);


    } else {
      final snackBar = SnackBar(
        content: Text('Username and password invalid'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

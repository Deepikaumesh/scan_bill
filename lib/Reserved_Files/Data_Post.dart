import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Data_Post extends StatefulWidget {
  const Data_Post({Key? key}) : super(key: key);

  @override
  _Data_PostState createState() => _Data_PostState();
}

class _Data_PostState extends State<Data_Post> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();

  late bool status;
  late String message;

  @override
  void initState() {
    name = TextEditingController();
    address = TextEditingController();

    status = false;
    message = "";

    super.initState();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.20),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 35, right: 35),
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      keyboardType: TextInputType.text,
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
                          hintText: "name",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: address,
                      keyboardType: TextInputType.text,
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
                          hintText: "address",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        RegistrationUser();
                        name.clear();
                        address.clear();
                      },
                      child: Text("Sign Up"),
                    ),
                    Text(
                      status ? message : message,
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future RegistrationUser() async {
    var APIURL =
        "http://192.168.29.64:80/MySampleApp/go1.php"; //intego wifi ip address

    //json maping user entered details
    Map maped_data = {
      'name': name.text,
      'address': address.text,
    };
    //send  data using http post to our php code
    http.Response reponse =
        await http.post(Uri.parse(APIURL), body: maped_data);

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    var responseMessage = data["message"];
    var responseError = data["error"];

    // print("DATA: ${data}");
    print(data);

    if (responseError) {
      setState(() {
        status = false;
        message = responseMessage;
      });
    } else {
      name.clear();
      address.clear();

      setState(() {
        status = true;
        message = responseMessage;
      });
    }
  }
}

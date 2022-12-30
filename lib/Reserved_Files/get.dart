import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

//Creating a class user to store the data;
class User {
  // final String id;
  final String id;
  final String name;
  final String image;

  User({
    // required this.id,
    required this.id,
    required this.name,
    required this.image,
  });
}

class Get_Data extends StatefulWidget {
  @override
  _Get_DataState createState() => _Get_DataState();
}

class _Get_DataState extends State<Get_Data> {
//Applying get request.

  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    String url = "http://192.168.29.64:80/MySampleApp/Other/get.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
        //id:  singleUser["id"].toString(),
        id: singleUser["id"].toString(),
        name: singleUser["name"].toString(),
        image: singleUser["image"].toString(),
      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Fetch data from internet",
            style: GoogleFonts.prompt(fontSize: 22),
          ),
        ),
        body: Scaffold(
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: FutureBuilder(
              future: getRequest(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.red.shade900,
                            strokeWidth: 5,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Data Loading Please Wait!",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                            shadowColor: Colors.red,
                            elevation: 8,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              // color: Colors.red,
                              height: 170,
                              width: 400,
                              padding: EdgeInsets.fromLTRB(10, 15, 50, 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      snapshot.data[index].image,
                                      height: 100,
                                      width: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Id : " + snapshot.data[index].id,
                                        style: TextStyle(
                                            color: Colors.red.shade600),
                                      ),
                                      Text(
                                        "Name : " + snapshot.data[index].name,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

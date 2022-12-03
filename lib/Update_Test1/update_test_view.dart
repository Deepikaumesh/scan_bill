// import 'dart:convert';
// import 'package:ecommerce_scan_andbill_app/update_test_update.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
//
// //Creating a class user to store the data;
// class User {
//   // final String id;
//   final String id;
//   final String name;
//
//
//   User({
//     // required this.id,
//     required this.id,
//     required this.name,
//
//   });
// }
//
// class update_test_view extends StatefulWidget {
//   List list;
//   int index;
//   update_test_view({required this.index,required this.list});
//   @override
//   _update_test_viewState createState() => _update_test_viewState();
// }
//
// class _update_test_viewState extends State<update_test_view> {
//
//
// //Applying get request.
//
//
//   Future<List<User>> Display_Image_Request() async {
//     //replace your restFull API here.
//     String url =
//         "https://anthracitic-pecks.000webhostapp.com/view_test5.php";
//
//     final response = await http.get(Uri.parse(url));
//
//     var responseData = json.decode(response.body);
//
//     //Creating a list to store input data;
//     List<User> users = [];
//     for (var singleUser in responseData) {
//       User user = User(
//         name: singleUser["name"].toString(),
//         id: '',
//       );
//
//       //Adding user to the list.
//       users.add(user);
//     }
//     return users;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             "Fetch data from internet",
//             style: GoogleFonts.prompt(fontSize: 22),
//           ),
//         ),
//         body: Container(
//           padding: EdgeInsets.all(16.0),
//           child: FutureBuilder(
//             future: Display_Image_Request(),
//             builder: (BuildContext ctx, AsyncSnapshot snapshot) {
//               if (snapshot.data == null) {
//                 return Container(
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CircularProgressIndicator(
//                           color: Colors.red.shade900,
//                           strokeWidth: 5,
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Text(
//                           "Data Loading Please Wait!",
//                           style: TextStyle(),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               } else {
//                 return ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (ctx, index) => Column(
//                     children: [
//                       GestureDetector(
//                         onTap: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>update_test_update(list: widget.list, index: widget.index)));
//                         },
//                         child: Text(
//                           snapshot.data[index].name,
//                         ),
//                       ),
//
//                       SizedBox(
//                         height: 20,
//                       ),
//                     ],
//                   ),
//
//                   //     Card(
//                   //   margin: EdgeInsets.all(10),
//                   //   shape: RoundedRectangleBorder(
//                   //     borderRadius: BorderRadius.circular(20.0),
//                   //   ),
//                   //   child:
//                   //   ListTile(
//                   //       minLeadingWidth: 5,
//                   //       // contentPadding: EdgeInsets.all(5.0),
//                   //       leading: Icon(
//                   //         Icons.circle,
//                   //         size: 10,
//                   //         color: Colors.red.shade900,
//                   //       ),
//                   //       title: Text(
//                   //         snapshot.data[index].username,
//                   //         style: GoogleFonts.lora(
//                   //             fontSize: 13, color: Colors.pink.shade700),
//                   //       ),
//                   //       onTap: () {
//                   //         // Navigator.push(context,
//                   //         //     MaterialPageRoute(builder: (context) {
//                   //         //   return Merchant_Login(snapshot.data[index]);
//                   //         // }));
//                   //       }),
//                   // ),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
import 'dart:convert';

import 'package:ecommerce_scan_andbill_app/scanner_app/Customer/Customer_Dashboard.dart';
import 'package:ecommerce_scan_andbill_app/Update_Test1/update_test_detailpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;



class update_test_view extends StatefulWidget {
  @override
  _update_test_viewState createState() =>
      new _update_test_viewState();
}

class _update_test_viewState extends State<update_test_view> {


  Future<List> getData() async {
    final response = await http.get(Uri.parse(
        "https://anthracitic-pecks.000webhostapp.com/view_test5.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.shade800,
        title: Text(
          "view data",
          style: GoogleFonts.prompt(fontSize: 22),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Customer_Dashboard()));
          },
        ),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
            // list: snapshot.data,
            list: snapshot.data ?? [],
          )
              : new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new update_test_detailpage(
                  list: list,
                  index: i,
                ))),
            child: new Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListTile(
                minLeadingWidth: 5,
                // contentPadding: EdgeInsets.all(5.0),
                leading: Icon(
                  Icons.circle,
                  size: 10,
                  color: Colors.red.shade900,
                ),

                title: Text(
                  (list[i]['name']),
                  style: GoogleFonts.lora(
                      fontSize: 13, color: Colors.pink.shade700),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}



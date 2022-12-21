// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../../scanner_app/Customer/ViewCart.dart';
// import 'Custome_Data_Edit.dart';
//
//
//
//
// class Customer_Data_DetailPage extends StatefulWidget {
//   final User userdata;
//
//   Customer_Data_DetailPage({required this.userdata});
//
//   @override
//   _Customer_Data_DetailPageState createState() =>
//       _Customer_Data_DetailPageState();
// }
//
// class _Customer_Data_DetailPageState extends State<Customer_Data_DetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//
//         title: Text('Details'),
//       ),
//       body: Container(
//         height: 270.0,
//         padding: const EdgeInsets.all(35),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               "Name : ${widget.userdata.productname}",
//               style: TextStyle(fontSize: 20),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//             ),
//             Text(
//               "Productprice : ${widget.userdata.productprice}",
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.edit),
//         onPressed: ()
//         => Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (BuildContext context) => Edit(userdata: widget.userdata),
//         ),
//       ),
//       ),
//     );
//   }
// }

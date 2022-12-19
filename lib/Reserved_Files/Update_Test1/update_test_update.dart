
import 'package:ecommerce_scan_andbill_app/Reserved_Files/Update_Test1/update_test_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class update_test_update extends StatefulWidget {
  final List list;
  final int index;

  update_test_update({required this.list, required this.index});

  @override
  _update_test_updateState createState() => new _update_test_updateState();
}

class _update_test_updateState extends State<update_test_update> {
  TextEditingController controllername = TextEditingController();

  UpdateData() {
    var url = "https://anthracitic-pecks.000webhostapp.com/update_test5.php";
    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
      "name": controllername.text,
    });
  }

  @override
  void initState() {
    controllername =
        new TextEditingController(text: widget.list[widget.index]['name']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "EDIT DATA",
          style: GoogleFonts.prompt(color: Colors.red.shade900),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.red.shade900,
            size: 35, // add custom icons also
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllername,
                  decoration: new InputDecoration(
                      hintText: "News Title", labelText: "News Title"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new ElevatedButton(
                  child: new Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  //  color: Colors.red.shade900,
                  onPressed: () {
                    setState(() {});
                    UpdateData();

                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => update_test_view()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

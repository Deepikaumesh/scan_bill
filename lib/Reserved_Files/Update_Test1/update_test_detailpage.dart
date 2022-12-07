
import 'package:ecommerce_scan_andbill_app/Reserved_Files/Update_Test1/update_test_update.dart';
import 'package:ecommerce_scan_andbill_app/Reserved_Files/Update_Test1/update_test_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;






class update_test_detailpage extends StatefulWidget {
  List list;
  int index;
  update_test_detailpage({required this.index,required this.list});
  @override
  _update_test_detailpageState createState() => new _update_test_detailpageState();
}

class _update_test_detailpageState extends State<update_test_detailpage> {



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(title: new Text("${widget.list[widget.index]['name']}"),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.shade800,
        title:Text("${widget.list[widget.index]['name']}",
          style: GoogleFonts.prompt(fontSize: 22),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>update_test_view()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context)=>new update_test_update(list: widget.list, index: widget.index,),
                ), );
            },
          ),
        ],
      ),

      body: new Container(
        height:MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              //new Padding(padding: const EdgeInsets.only(top: 30.0),),
              new Text(widget.list[widget.index]['name'],
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 20.0, color: Colors.black,),
                overflow: TextOverflow.visible,),






            ],
          ),
        ),
      ),
    );
  }
}






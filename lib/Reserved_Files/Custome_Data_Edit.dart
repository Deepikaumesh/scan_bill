import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../scanner_app/Customer/ViewCart.dart';



class Edit extends StatefulWidget {
  final User userdata;

  Edit({required this.userdata});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {


  // This is for text onChange
  TextEditingController productqtyController =new TextEditingController();
  TextEditingController stockcontroller = new TextEditingController();
  TextEditingController productidController =new TextEditingController();
  TextEditingController productpricecontroller = new TextEditingController();
  TextEditingController productnameController =new TextEditingController();


  // Http post request









  Future editStudent() async {
    return await http.post(Uri.parse(
      "https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/Update_productqty.php",),
      body: {
        "id": widget.userdata.id.toString(),
        "productid": productidController.text,
        "productname": productnameController.text,
        "productprice": productpricecontroller.text,
        "productqty": productqtyController.text,

        "stock": stockcontroller.text

      },
    );
  }

  void _onConfirm(context) async {
    await editStudent();
  }

  @override
  void initState() {
    productidController = TextEditingController(text: widget.userdata.productid.toString());
    productnameController = TextEditingController(text: widget.userdata.productname);
productpricecontroller = TextEditingController(text: widget.userdata.productprice.toString());
productqtyController = TextEditingController(text: widget.userdata.productqty.toString());
    stockcontroller = TextEditingController(text: widget.userdata.stock.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          child: Text('CONFIRM'),
          onPressed: () {

            setState(() {
               _onConfirm(context);

            });
            editStudent();

            Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewcart()));
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                // new TextField(
                //   controller: productidController,
                //   decoration: new InputDecoration(
                //       hintText: "News Title", labelText: "News Title"),
                // ),
                // TextField(
                //   controller: productnameController,
                //   decoration: new InputDecoration(
                //       hintText: "News Title", labelText: "News Title"),
                // ),
                // new TextField(
                //   controller: productpricecontroller,
                //   decoration: new InputDecoration(
                //       hintText: "News Title", labelText: "News Title"),
                // ),
                TextField(
                  controller: productqtyController,
                  decoration: new InputDecoration(
                      hintText: "News Title", labelText: "News Title"),
                ),
                // ClipRRect(
                //   borderRadius:
                //   BorderRadius.circular(8.0),
                //   child: Image.network(widget.userdata.image,
                //     height: 100,
                //     width: 100.0,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                InkWell(
                  child: Icon(
                    Icons.arrow_drop_up,
                    size: 25.0,


                  ),
                  onTap: (){
                    int currentValue = int.parse(productqtyController.text);
                    setState(() {
                      currentValue++;
                      productqtyController.text = (currentValue).toString();
                    });
                  },
                ),
                InkWell(
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 25.0,


                  ),
                  onTap: (){
                    int currentValue = int.parse(productqtyController.text);
                    setState(() {

                        currentValue--;
                        productqtyController.text = (currentValue > 0 ? currentValue : 1).toString();


                    });
                  },
                )


              ],

            ),
          ),
        ),
      ),
    );
  }
}
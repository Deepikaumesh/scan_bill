import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Merchant_Product_Registration extends StatefulWidget {

  @override
  _Merchant_Product_RegistrationState createState() =>
      _Merchant_Product_RegistrationState();
}

class _Merchant_Product_RegistrationState
    extends State<Merchant_Product_Registration> {
  var _image;
  final picker = ImagePicker();

  Future choose_image() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this._image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  // Future uploadImage() async {
  //   final uri = Uri.parse(
  //       "https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/Add_Product_to_db.php");
  //   // "http://192.168.29.64/MySampleApp/Scanner_App/Merchant/Add_Product_to_db.php");
  //   var request = http.MultipartRequest('POST', uri);
  //   request.fields['productid'] = qr_controller.text;
  //   request.fields['productname'] = Productname.text;
  //   request.fields['productprice'] = productprice.text;
  //   //  request.fields['productqty'] = productqty.text;
  //   request.fields['stock'] = stock.text;
  //   var pic = await http.MultipartFile.fromPath("image", _image.path);
  //   request.files.add(pic);
  //   var response = await request.send();
  //   print(response);
  //
  //
  //   if (response.statusCode == 200) {
  //     print('Image Uploded');
  //     qr_controller.clear();
  //     productprice.clear();
  //     //  productqty.clear();
  //     Productname.clear();
  //     stock.clear();
  //
  //     final snackBar = await SnackBar(
  //       content: const Text('Product Added Successfully!'),
  //       action: SnackBarAction(
  //         label: 'Ok',
  //         onPressed: () {
  //           //Navigator.pop(context);
  //           // Some code to undo the change.
  //         },
  //       ),
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   } else {
  //     print('Image Not Uploded');
  //   }
  //   setState(() {
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber.shade300,
          title: Center(
            child: Text(
              "choose image",
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose Image",
                  style: GoogleFonts.hindVadodara(
                    fontSize: 20,
                    color: Colors.cyan,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.photo_outlined,
                    size: 35,
                    color: Colors.cyan,
                  ),
                  onPressed: () {
                    choose_image();
                  },
                ),
              ],
            ),
            Center(
              child: Container(
                  height: 100,
                  width: 200,
                  //decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),  color: Colors.grey,
                  //),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: _image != null
                        ? Image.file(
                            _image,
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: Text(
                            "No image selected",
                            style: GoogleFonts.hindVadodara(
                                fontSize: 13, color: Colors.red.shade900),
                          )),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.grey.shade500,
                padding:
                    EdgeInsets.only(left: 110, right: 110, top: 20, bottom: 20),
              ),
              onPressed: () {
                setState(() {});
                //  uploadImage();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

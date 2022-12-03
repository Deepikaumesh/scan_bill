import 'dart:convert';

// List<User> welcomeFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
//
// String welcomeToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.productid,
    required this.productname,
    required this.productprice,
    required this.productqty,
    required this.image,
  });

  String id;

  String productid;
  String productname;
  String  productprice;
  String  productqty;
  String image;

  // factory User.fromJson(Map<dynamic, dynamic> json) => User(
  //   id: json["id"],
  //   productid: json["productid"],
  //   productname: json["productname"],
  //   productprice: json["productprice"],
  //   productqty: json["productqty"],
  //   image: json["image"],
  // );
  //
  // Map<dynamic, dynamic> toJson() => {
  //   "id": id,
  //   "productid": productid,
  //   "productname": productname,
  //   "productprice": productprice,
  //   "productqty": productqty,
  //   "image": image,
  // };
}

import 'package:flutter/material.dart';

import 'ProductModel.dart';

class CheckoutScreen extends StatefulWidget {
  dynamic cart1;
  dynamic  sum;
  dynamic total;

  CheckoutScreen(
    this.cart1,
    this.sum,
    this.total,
  );

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  // String returnTotalAmount(List<User1> _employee) {
  //   double totalAmount = 0.0;
  //
  //   for (int i = 0; i < _employee.length; i++) {
  //     totalAmount = totalAmount + (double.parse(_employee[i].productprice)*double.parse(_employee[i].productqty));
  //   }
  //   return totalAmount.toString();
  // }


  //
  // Container totalAmount(List<User1> _employee) {
  //   return Container(
  //     margin: EdgeInsets.only(right: 10),
  //     padding: EdgeInsets.all(25),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: <Widget>[
  //         Text(
  //           " Total:",
  //           style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
  //         ),
  //         Text("\$${returnTotalAmount(_employee)}",
  //           style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(widget.cart1[index].productname.toString()),
              //  trailing:Text(widget.cart1[index].productprice),




                trailing: Text(
                  "\$${widget.cart1[index].productqty + widget.cart1[index].productprice}",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Column(
                  children: [
                    Text(
                      "price:${widget.cart1[index].productprice}",
                    ),
                    Row(
                      children: [
                        Text("Qty"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${widget.cart1[index].productqty}",
                        ),
                      ],
                    ),
                  ],
                ),
                onTap: () {},
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: widget.cart1.length,
            shrinkWrap: true,
          ),
          // Text("sub Total : \$$total"),

          Divider(),
          Text("Total : \$${widget.sum}"),


        ],
      ),
    );
  }
}

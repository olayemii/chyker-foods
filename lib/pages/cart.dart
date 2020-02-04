import 'package:flutter/material.dart';
import 'package:food_delivery/styles/styles.dart';

class Cart extends StatelessWidget {
  Widget _getTile() {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
      leading: Image.network(
        'https://www.tfc.com.ng/order/images/chicken_pie.jpg',
        width: 70.0,
        height: 70.0,
        fit: BoxFit.fill,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "1",
            style: TextStyle(
                color: blackColor, fontSize: 17.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "x",
            style: TextStyle(
                color: blackColor, fontSize: 17.0, fontWeight: FontWeight.bold),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 120.0),
            child: Text(
              "Beach BBQBurger",
              style: TextStyle(
                  color: blackColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "\$20.99",
            style: TextStyle(color: primaryColor, fontSize: 16.0),
          )
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        color: Colors.red,
        icon: Icon(
          Icons.delete,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, backgroundColor: whiteSmokeColor);
  }
}

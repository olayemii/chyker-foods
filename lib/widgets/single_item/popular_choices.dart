import 'package:flutter/material.dart';
import 'package:food_delivery/styles/styles.dart';
import 'package:food_delivery/widgets/rater.dart';

class PopularChoice extends StatelessWidget {
  String name;
  String image;
  int rating;
  int price;
  PopularChoice({this.name, this.image, this.price, this.rating});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(image, height: 120.0, width: 150.0, fit: BoxFit.cover),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: blackColor,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "N" + price.toString(),
                  style: TextStyle(color: Colors.grey),
                ),
                Rater(
                  rate: rating,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

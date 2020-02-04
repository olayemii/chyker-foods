import 'package:flutter/material.dart';
import 'package:food_delivery/router/routing_constants.dart';
import 'package:food_delivery/styles/styles.dart';

class PageTemplate extends StatelessWidget {
  final String image;
  final double width;

  PageTemplate({@required this.image, @required this.width})
      : assert(image != null, width != null);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  image,
                  width: width,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Get Food at your Doorsteps",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: blackColor),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Duis pariatur incididunt tempor sunt non sunt aliqua mollit anim.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, color: blackColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

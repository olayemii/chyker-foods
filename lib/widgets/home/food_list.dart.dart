import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/styles/styles.dart';
import 'package:food_delivery/utils/fsprovider.dart';
import 'package:food_delivery/widgets/rater.dart';

class FoodList extends StatelessWidget {
  final List<DocumentSnapshot> foods;
  FoodList({this.foods});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 15.0,
      ),
      itemCount: foods.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
          leading: Image.network(
            foods[index].data["image"],
            width: 80.0,
            height: 100.0,
            fit: BoxFit.fill,
          ),
          title: Text(
            foods[index].data["name"],
            style: TextStyle(
                fontSize: 16.0, fontWeight: FontWeight.w700, color: blackColor),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 3.0),
              Text(
                "N" + foods[index].data['price'].toString(),
                style: TextStyle(fontSize: 17.0, color: Colors.grey),
              ),
              SizedBox(height: 3.0),
              Row(
                children: <Widget>[
                  Rater(
                    rate: foods[index].data["rating"],
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "(283)",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

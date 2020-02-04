import 'package:flutter/material.dart';
import 'package:food_delivery/router/routing_constants.dart';
import 'package:food_delivery/widgets/rater.dart';
import '.././../styles/styles.dart';

class FoodGrid extends StatelessWidget {
  final List foods;
  FoodGrid({this.foods});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.3;
    final double itemWidth = size.width / 2;
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 3.0,
      mainAxisSpacing: 4.0,
      childAspectRatio: (itemWidth / itemHeight) + 0.1,
      children: foods.map((item) {
        return Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey[300])),
            child: Hero(
              tag: item.data["name"],
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(SingleItemRoute, arguments: {
                    "heroTag": item.data["name"],
                    "data": item.data
                  });
                },
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  elevation: 0,
                  semanticContainer: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Image.network(
                          item.data["image"],
                          fit: BoxFit.cover,
                          width: size.width / 2,
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.data["name"],
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  color: blackColor),
                            ),
                            SizedBox(height: 3.0),
                            Text(
                              "N" + item.data["price"].toString(),
                              style:
                                  TextStyle(fontSize: 17.0, color: Colors.grey),
                            ),
                            SizedBox(height: 3.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Rater(
                                  rate: item.data["rating"],
                                ),
                                Text(
                                  "(283)",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16.0),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
      }).toList(),
    );
  }
}

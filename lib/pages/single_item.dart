import 'package:flutter/material.dart';
import 'package:food_delivery/styles/styles.dart';
import 'package:food_delivery/utils/fsprovider.dart';
import 'package:food_delivery/widgets/rater.dart';
import 'package:food_delivery/widgets/single_item/popular_choices.dart';

class SingleItem extends StatefulWidget {
  final Map arguments;
  SingleItem({this.arguments});
  @override
  State<StatefulWidget> createState() {
    return _SingleItemState();
  }
}

class _SingleItemState extends State<SingleItem> {
  final FireStoreProvider _fireStoreProvider = FireStoreProvider();
  int _quantity = 1;
  List _foods;

  @override
  void initState() {
    super.initState();
    getFoods();
  }

  void getFoods() {
    _fireStoreProvider.getFoods(null).then((res) {
      this.setState(() {
        _foods = res.documents.toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = widget.arguments;
    String heroTag = widget.arguments['heroTag'];
    Map data = arguments['data'];
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {},
          child: Icon(Icons.shopping_cart, color: Colors.white),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                    tag: "$heroTag",
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 280.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: NetworkImage(data['image']))),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Icon(
                                        Icons.keyboard_backspace,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                SizedBox(
                                  width: 40.0,
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 24.0,
                                )
                              ],
                            )),
                      ],
                    )),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(data['name'],
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                              color: blackColor)),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("N" + data['price'].toString(),
                          style: TextStyle(fontSize: 20.0, color: Colors.grey)),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Rater(
                            rate: data['rating'],
                            size: 22.0,
                          ),
                          SizedBox(
                            width: 18.0,
                          ),
                          Text("238 reviews",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.grey)),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Divider(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(child: Text("Quantity")),
                          Container(
                            width: 45.0,
                            child: FlatButton(
                              child: Text("-"),
                              color: Colors.grey,
                              onPressed: () {
                                this.setState(() {
                                  _quantity -= 1;
                                });
                              },
                            ),
                          ),
                          Container(
                            height: 37.0,
                            color: whiteSmokeColor,
                            alignment: Alignment.center,
                            width: 45.0,
                            child: Text("$_quantity"),
                          ),
                          Container(
                            width: 45.0,
                            child: FlatButton(
                              child: Text("+"),
                              color: Colors.grey,
                              onPressed: () {
                                this.setState(() {
                                  _quantity += 1;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 30.0),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: primaryColor,
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    color: Colors.white,
                    child: Column(children: <Widget>[
                      Text(
                        "Amet do officia quis occaecat incididunt sit quis officia aute dolor. Et occaecat veniam duis amet exercitation laboris in mollit. Laboris velit eu consequat voluptate Lorem.",
                        style: TextStyle(
                            fontSize: 17.0, color: Colors.grey, height: 1.5),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'CAL',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor),
                              ),
                              Text('140g'),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'CFF',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor),
                              ),
                              Text('140g'),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'CHO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor),
                              ),
                              Text('140g'),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'GRP',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor),
                              ),
                              Text('140g'),
                            ],
                          )
                        ],
                      ),
                    ])),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "POPULAR CHOICES",
                        style: TextStyle(color: Colors.grey, fontSize: 18.0),
                      ),
                      _foods == null
                          ? Center(
                              child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(primaryColor),
                            ))
                          : Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              height: 200.0,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: _foods.map((food) {
                                  return PopularChoice(
                                      name: food.data["name"],
                                      image: food.data["image"],
                                      price: food.data["price"],
                                      rating: food.data["rating"]);
                                }).toList(),
                              ),
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

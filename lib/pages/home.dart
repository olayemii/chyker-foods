import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/router/routing_constants.dart';
import 'package:food_delivery/shared_prefs.dart';
import 'package:food_delivery/styles/styles.dart';
import 'package:food_delivery/utils/fsprovider.dart';
import 'package:food_delivery/widgets/home/food_grids.dart';
import 'package:food_delivery/widgets/home/food_list.dart.dart';
import 'package:food_delivery/widgets/home/home_filters.dart';

enum ViewTypes { list, grid }

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> with TickerProviderStateMixin {
  ViewTypes viewType = ViewTypes.grid;
  TabController _tabController;
  int _activeTabIndex = 0;
  List<Widget> _tabItems = <Widget>[
    Tab(
        child: Text(
      "Snacks",
      style: TextStyle(fontSize: 16.0),
    )),
    Tab(
        child: Text(
      "Meals",
      style: TextStyle(fontSize: 16.0),
    )),
    Tab(
        child: Text(
      "Traditional",
      style: TextStyle(fontSize: 16.0),
    )),
    Tab(
        child: Text(
      "Recommended",
      style: TextStyle(fontSize: 16.0),
    )),
    Tab(
        child: Text(
      "Top Picks",
      style: TextStyle(fontSize: 16.0),
    )),
  ];
  void changeViewState(ViewTypes value) {
    this.setState(() {
      viewType = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: _tabItems.length);
    _tabController.addListener(() {
      getFoods(_tabController.index);
    });

    getFoods(0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<DocumentSnapshot> _foods;
  bool _loading = true;
  final FireStoreProvider _fireStoreProvider = FireStoreProvider();

  void getFoods(int foodCategory) async {
    this.setState(() {
      _loading = true;
    });
    _fireStoreProvider.getFoods(foodCategory).then((data) {
      this.setState(() {
        _foods = data.documents;
        _loading = false;
      });
    });
  }

  Widget _generateTabBars() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      indicatorColor: Colors.white,
      tabs: _tabItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteSmokeColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.of(context).pushNamed(CartRoute);
        },
        child: Icon(Icons.shopping_cart, color: Colors.white),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width - 80.0,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  color: primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            NetworkImage("https://via.placeholder.com/150"),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Text(
                        "Olayemi Garuba",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0),
                      ),
                      Text(
                        "donyemisco@gmail.com",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          "Account",
                          style: TextStyle(color: blackColor),
                        )),
                    Divider(
                      height: 1.0,
                    ),
                    ListTile(
                        leading: Icon(Icons.insert_drive_file),
                        title: Text(
                          "Orders",
                          style: TextStyle(color: blackColor),
                        )),
                    Divider(
                      height: 1.0,
                    ),
                    ListTile(
                        leading: Icon(Icons.local_play),
                        title: Text(
                          "Deals",
                          style: TextStyle(color: blackColor),
                        )),
                    Divider(
                      height: 1.0,
                    ),
                    ListTile(
                        leading: Icon(Icons.favorite),
                        title: Text(
                          "Favorites",
                          style: TextStyle(color: blackColor),
                        )),
                    Divider(
                      height: 1.0,
                    ),
                    ListTile(
                        leading: Icon(Icons.card_giftcard),
                        title: Text(
                          "Coupons & Bonuses",
                          style: TextStyle(color: blackColor),
                        )),
                    Divider(
                      height: 1.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      child: Text('Settings'),
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      child: Text('Info'),
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      child: GestureDetector(
                        child: Text('Logout'),
                        onTap: () {
                          setLoginState(false).then((_) {
                            {
                              Navigator.of(context).pushNamed(AuthMainRoute);
                            }
                          });
                        },
                      ),
                    )
                  ],
                ))
              ],
            )),
      ),
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 140.0),
          child: Builder(
            builder: (BuildContext context) => Container(
                padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 0.0),
                color: primaryColor,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 50.0,
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                                flex: 2,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                        onTap: () {
                                          Scaffold.of(context).openDrawer();
                                        },
                                        child: Icon(
                                          Icons.menu,
                                          color: Colors.grey[700],
                                        )))),
                            Expanded(
                                flex: 11,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                left: BorderSide(
                                                    color: Colors.grey[300]),
                                                right: BorderSide(
                                                    color: Colors.grey[300]))),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Icon(
                                              Icons.search,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 10.0),
                                            Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Restaurant",
                                                style: TextStyle(
                                                  fontSize: 17.0,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            Expanded(
                                flex: 4,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Icon(Icons.pin_drop, color: primaryColor),
                                      Wrap(
                                        children: <Widget>[
                                          Text(
                                            "Lagos",
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 17.0,
                                            ),
                                          )
                                        ],
                                      )
                                    ]))
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.bottomCenter,
                              child: _generateTabBars())),
                    ],
                  ),
                )),
          )),
      body: Column(
        children: <Widget>[
          HomeFilter(
            currentState: viewType,
            changeState: changeViewState,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                getTabView(),
                getTabView(),
                getTabView(),
                getTabView(),
                getTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getTabView() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: _loading
                  ? Center(
                      child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                    ))
                  : viewType == ViewTypes.grid
                      ? FoodGrid(foods: _foods)
                      : FoodList(foods: _foods),
            )
          ],
        ));
  }
}

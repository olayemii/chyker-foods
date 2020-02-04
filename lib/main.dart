import 'package:flutter/material.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:food_delivery/pages/onboard_page.dart';
import 'package:food_delivery/pages/wrapper.dart';
import 'package:food_delivery/router/router.dart';
import 'package:food_delivery/router/routing_constants.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: generateRoute,
    theme: ThemeData(
        textTheme: TextTheme(
            title: TextStyle(
                fontFamily: "ProximaNova",
                fontSize: 34.0,
                fontWeight: FontWeight.w700),
            body1: TextStyle(fontFamily: "ProximaNova", fontSize: 16.0),
            subhead: TextStyle(fontFamily: "ProximaNova", fontSize: 22))),
    home: Wrapper()));

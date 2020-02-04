import 'package:flutter/material.dart';
import 'package:food_delivery/pages/auth_main.dart';
import 'package:food_delivery/pages/cart.dart';
import 'package:food_delivery/pages/home.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:food_delivery/pages/onboard_page.dart';
import 'package:food_delivery/pages/registration.dart';
import 'package:food_delivery/pages/single_item.dart';
import 'package:food_delivery/router/routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return MaterialPageRoute(builder: (BuildContext context) => HomePage());
    case LoginRoute:
      return MaterialPageRoute(builder: (BuildContext context) => Login());
    case RegisterRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => Registration());
    case CartRoute:
      return MaterialPageRoute(builder: (BuildContext context) => Cart());
    case AuthMainRoute:
      return MaterialPageRoute(builder: (BuildContext context) => AuthMain());
    case OnboardPageRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => OnboardPages());
    case SingleItemRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) =>
              SingleItem(arguments: settings.arguments));
    default:
      return MaterialPageRoute(builder: (BuildContext context) => Login());
  }
}

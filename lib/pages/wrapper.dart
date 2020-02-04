import 'package:flutter/material.dart';
import 'package:food_delivery/router/routing_constants.dart';
import 'package:food_delivery/shared_prefs.dart';
import 'package:food_delivery/styles/styles.dart';

class Wrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Wrapper();
  }
}

class _Wrapper extends State {
  @override
  void initState() {
    super.initState();
    getRenderPage();
  }

  Future<void> getRenderPage() async {
    bool loginState = await getLoginState();
    bool firstTimeState = await getFirstTimeState();
    if (firstTimeState != null) {
      if (loginState != null) {
        Navigator.pushNamed(context, HomePageRoute);
      } else {
        Navigator.pushNamed(context, AuthMainRoute);
      }
    } else {
      Navigator.pushNamed(context, OnboardPageRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      color: primaryColor,
    ));
  }
}

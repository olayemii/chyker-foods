import 'package:flutter/material.dart';
import 'package:food_delivery/styles/styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushNamed("/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          color: primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/logo.png",
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Tasty foods with the sauce",
                      style: Theme.of(context).textTheme.body1.merge(
                          TextStyle(color: Colors.white, fontSize: 18.0)),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Wrap(
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                      strokeWidth: 2,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                    width: 20.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

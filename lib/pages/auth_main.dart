import 'package:flutter/material.dart';
import 'package:food_delivery/router/routing_constants.dart';

class AuthMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            height: deviceSize.height,
            decoration: BoxDecoration(
              color: Colors.orange[700],
            ),
          ),
          SafeArea(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Image.asset("assets/images/logo.png"),
                          ),
                        ),
                        Text(
                          "Chyker Foods",
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
                        Text(
                          "Voluptate aliqua voluptate adipisicing mollit incididunt nulla non nulla sunt ut enim nostrud esse ex.",
                          style: TextStyle(
                              color: Colors.white, height: 1.5, fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          width: deviceSize.width,
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: FlatButton(
                              color: Colors.white,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed(LoginRoute);
                              }),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: Colors.white,
                              )),
                          width: deviceSize.width,
                          height: 50.0,
                          child: FlatButton(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed(RegisterRoute);
                              }),
                        )
                      ])))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery/router/routing_constants.dart';
import 'package:food_delivery/shared_prefs.dart';
import 'package:food_delivery/styles/styles.dart';
import 'package:food_delivery/utils/auth.dart';
import 'package:food_delivery/widgets/formfield.dart';

class Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationState();
  }
}

class _RegistrationState extends State<Registration> {
  final AuthService _authService = AuthService();
  bool _loading = false;
  Map userData = {
    "email": "",
    "password": "",
    "phone_number": "",
    "confirm_password": "",
  };

  void onFormChange(key, value) {
    this.setState(() {
      userData[key] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          decoration: BoxDecoration(color: whiteSmokeColor),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "Welcome, ",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .merge(TextStyle(color: blackColor)),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text("Sign up to continue",
                          style: Theme.of(context).textTheme.subhead.merge(
                              TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500))),
                      SizedBox(
                        height: 50.0,
                      ),
                      CustomFormField(
                        name: "email",
                        label: "Email Address",
                        onChange: onFormChange,
                      ),
                      CustomFormField(
                        label: "Phone Number",
                        name: "phone_number",
                        onChange: onFormChange,
                      ),
                      CustomFormField(
                          label: "Password",
                          name: "password",
                          onChange: onFormChange,
                          obscureText: true),
                      CustomFormField(
                        label: "Confirm Password",
                        name: "confirm_password",
                        obscureText: true,
                        onChange: onFormChange,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(LoginRoute);
                            },
                            child: Text(
                              "Already have an account?",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  height: 50.0,
                  child: FlatButton(
                      color: primaryColor,
                      child: _loading
                          ? Container(
                              height: 27.0,
                              width: 27.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ))
                          : Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400),
                            ),
                      onPressed: () {
                        _registerUser(context, userData);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      )),
                ),
              ],
            ),
          )),
    );
  }

  Future<void> _registerUser(BuildContext context, Map userData) async {
    this.setState(() {
      _loading = true;
    });
    _authService.signUp(userData).then((res) {
      this.setState(() {
        _loading = false;
      });
      if (res != null) {
        setLoginState(true).then((res) {
          Navigator.of(context).pushReplacementNamed(HomePageRoute);
        });
      }
    });
  }
}

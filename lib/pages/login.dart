import 'package:flutter/material.dart';
import 'package:food_delivery/router/routing_constants.dart';
import 'package:food_delivery/shared_prefs.dart';
import 'package:food_delivery/styles/styles.dart';
import 'package:food_delivery/utils/auth.dart';
import 'package:food_delivery/widgets/custom_checkbox.dart';
import 'package:food_delivery/widgets/formfield.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State {
  Map loaders;
  Map<String, String> formData;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    loaders = {"login": false};
    formData = {"email": "", "password": ""};
  }

  void toggleLoadingState() {
    this.setState(() {
      loaders["login"] = loaders["login"] == null ? true : !loaders["login"];
    });
  }

  Future<void> _loginUser(BuildContext context) async {
    toggleLoadingState();
    _authService.signIn(formData).then((dynamic res) {
      toggleLoadingState();
      if (res != null) {
        setLoginState(true).then((_) {
          Navigator.of(context).pushNamed(HomePageRoute);
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Wrong Details"),
              content: Text("Unable to login"),
            );
          },
        );
      }
    });
  }

  void changeFormData(key, value) {
    this.setState(() {
      formData[key] = value;
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
                      "Welcome Back",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .merge(TextStyle(color: blackColor)),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text("Sign in to continue",
                        style: Theme.of(context).textTheme.subhead.merge(
                            TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500))),
                    SizedBox(
                      height: 50.0,
                    ),
                    CustomFormField(
                      label: "Email Address",
                      onChange: changeFormData,
                      name: "email",
                    ),
                    CustomFormField(
                      label: "Password",
                      onChange: changeFormData,
                      name: "password",
                      obscureText: true,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CustomCheckbox(
                                value: false,
                                useTapTarget: false,
                                onChanged: (v) {},
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Remember me",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          Expanded(
                            child: Text(
                              "Forgot Password?",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 50.0,
                child: FlatButton(
                    color: primaryColor,
                    child: loaders["login"]
                        ? Container(
                            height: 27.0,
                            width: 27.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 3.0,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ))
                        : Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          ),
                    onPressed: () {
                      _loginUser(context);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

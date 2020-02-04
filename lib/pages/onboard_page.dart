import 'package:flutter/material.dart';
import 'package:food_delivery/pages/onboardpages/page_template.dart';
import 'package:food_delivery/router/routing_constants.dart';
import 'package:food_delivery/shared_prefs.dart';
import 'package:food_delivery/styles/styles.dart';
import 'package:food_delivery/widgets/pages_stepper.dart';

class OnboardPages extends StatefulWidget {
  State<OnboardPages> createState() {
    return _OnboardPages();
  }
}

class _OnboardPages extends State<OnboardPages> {
  final PageController controller = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(children: <Widget>[
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: <Widget>[
                  PageTemplate(
                    image: "assets/images/page2.png",
                    width: 200.0,
                  ),
                  PageTemplate(
                    image: "assets/images/page3.png",
                    width: 300.0,
                  ),
                  PageTemplate(
                    image: "assets/images/page4.png",
                    width: 250.0,
                  ),
                  PageTemplate(
                    image: "assets/images/page5.png",
                    width: 200.0,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  onTap: () {
                    setFirstTimeState().then((res) {
                      Navigator.of(context).pushNamed(AuthMainRoute);
                    });
                  },
                ),
                PagesStepper(
                    currentStep: _currentPage + 1, controller: controller),
                GestureDetector(
                  onTap: () {
                    controller.nextPage(
                        duration: Duration(milliseconds: 3),
                        curve: Curves.ease);
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: primaryColor),
                  ),
                )
              ],
            )
          ]),
        ));
  }
}

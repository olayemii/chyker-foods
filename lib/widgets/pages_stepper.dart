import 'package:flutter/material.dart';
import 'package:food_delivery/styles/styles.dart';

class PagesStepper extends StatelessWidget {
  final int currentStep;
  final PageController controller;
  PagesStepper({@required this.currentStep, this.controller})
      : assert(currentStep != null);
  Widget _getStepperChildren(int stepperLength) {
    return Row(
        children:
            List.generate(stepperLength, (x) => x + 1).map((int currentIndex) {
      return GestureDetector(
          onTap: () {
            controller.animateToPage(currentIndex - 1,
                duration: Duration(milliseconds: 3), curve: Curves.ease);
          },
          child: Container(
            margin: EdgeInsets.only(
                right: currentIndex != stepperLength ? 10.0 : 0.0),
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
                color: currentStep != currentIndex
                    ? Colors.grey[200]
                    : primaryColor,
                shape: BoxShape.circle),
          ));
    }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[_getStepperChildren(4)],
    );
  }
}

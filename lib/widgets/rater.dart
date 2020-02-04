import 'package:flutter/material.dart';
import 'package:food_delivery/styles/styles.dart';

class Rater extends StatelessWidget {
  final int rate;
  final double size;
  Rater({@required this.rate, this.size: 20.0}) : assert(rate != null);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(5, (i) => i + 1).map((int currentRate) {
      return Icon(currentRate <= rate ? Icons.star : Icons.star_border,
          color: primaryColor, size: size);
    }).toList());
  }
}

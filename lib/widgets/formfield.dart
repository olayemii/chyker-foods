import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String name;
  final bool obscureText;
  final Function onChange;
  CustomFormField(
      {this.name, this.label, this.onChange, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label),
        SizedBox(
          height: 7.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: TextField(
            onChanged: (value) {
              onChange(name, value);
            },
            obscureText: obscureText,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                border: InputBorder.none,
                hintText: label,
                hintStyle: TextStyle(fontSize: 16.0)),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home.dart';
import 'package:food_delivery/styles/styles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeFilter extends StatefulWidget {
  final changeState;
  final currentState;

  HomeFilter({this.changeState, this.currentState});

  @override
  State<StatefulWidget> createState() {
    return _HomeFilter();
  }
}

class _HomeFilter extends State<HomeFilter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    MdiIcons.filter,
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Filter",
                    style: TextStyle(fontSize: 16.0),
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 0,
          child: Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    widget.changeState(ViewTypes.grid);
                  },
                  child: Icon(
                    MdiIcons.viewGrid,
                    size: 24.0,
                    color: widget.currentState == ViewTypes.grid
                        ? blackColor
                        : Colors.grey,
                  )),
              SizedBox(
                width: 4.0,
              ),
              GestureDetector(
                  onTap: () {
                    widget.changeState(ViewTypes.list);
                  },
                  child: Icon(
                    MdiIcons.checkboxBlank,
                    size: 24.0,
                    color: widget.currentState == ViewTypes.list
                        ? blackColor
                        : Colors.grey,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

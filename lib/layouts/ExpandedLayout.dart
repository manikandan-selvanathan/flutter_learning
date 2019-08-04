import 'package:flutter/material.dart';

class ExpandLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getColumn();
  }

  Widget getColumn()
  {
    var view=Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              height: 30,
            ),
          )
        ],
    );
    return view;
  }
}

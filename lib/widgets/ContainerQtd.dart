import 'package:flutter/material.dart';

class ContainerQtd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        //shape: BoxShape.circle,
      ),
      width: 100.0,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.remove),
          Text('0'),
          Icon(Icons.add),
        ],
      ),
    );
  }
}

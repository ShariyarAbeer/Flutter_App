import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Qus extends StatelessWidget {
  final String qusText;

  Qus(this.qusText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        qusText,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,

      ),
    );
  }
}

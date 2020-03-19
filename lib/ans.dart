import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ans extends StatelessWidget {
  final Function Hendler;
  final String ans;
  Ans(this.Hendler, this.ans);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(ans),
        onPressed: (Hendler)
      ),
    );
  }
}

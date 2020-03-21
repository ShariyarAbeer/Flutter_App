import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  var resultScore;
  final Function _reStart;

  Result(this.resultScore, this._reStart);

  String get resultLine {
    String resultText;
    if (resultScore <= 8) {
      resultText = " you are at 8";
    } else if (resultScore <= 20) {
      resultText = "you are at 20";
    } else {
      resultText = "you are up 20";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultLine,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(onPressed: _reStart, child: Text("Resrart Quiz",style: TextStyle(fontSize: 20),),textColor: Colors.blue, )
        ],
      ),
    );
  }
}

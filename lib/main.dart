import 'package:flutter/material.dart';
import './qus.dart';
import './ans.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var numberIndex = 0;

  void tapButton() {
    setState(() {
      numberIndex = numberIndex + 1;
    });
    print("Taped the Button");
  }

  @override
  Widget build(BuildContext context) {
    var number = [
      {
        "numberQus": "Color",
        "ans": ["Black", "Green", "Blue", "White"],
      },
      {
        "numberQus": "Adress",
        "ans": ["Mugda", "Basabo", "Maniknagor"],
      },
      {
        "numberQus": "Number",
        "ans": ["1", "2", "3", "4"],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Flutter App"),
        ),
        body: Column(
          children: <Widget>[
            Qus(number[numberIndex]["numberQus"]),
            ...(number[numberIndex]["ans"] as List<String>).map((ans) {
              return Ans(tapButton, ans);
            })
          ],
        ),
      ),
    );
  }
}

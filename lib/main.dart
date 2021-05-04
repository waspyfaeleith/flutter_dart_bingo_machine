import 'package:flutter/material.dart';
import 'dart:math';

import 'package:my_fun_app/check_screen.dart';

import 'components/rounded_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Bingo Machine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My Simple Bingo Machine'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var numbers = new List<int>.generate(90, (i) => i + 1);

  var calledNumbers = List.filled(90, 0);
  int calledNumber = 0;

  void _reset() {
    setState(() {
      numbers = new List<int>.generate(90, (i) => i + 1);
      calledNumbers = List.filled(90, 0);
      calledNumber = 0;
    });
  }

  void _getNextNumber() {
    setState(() {
      var rand = new Random();
      int index = rand.nextInt(numbers.length);
      calledNumber = numbers.removeAt(index);
      calledNumbers[calledNumber - 1] = calledNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              calledNumber == 0  ? 'Eyes Down...' : '$calledNumber',
              style: Theme.of(context).textTheme.headline1,
            ),
            RoundedButton(
              title: 'Get Number',
              color: Colors.lightGreen,
              onPressed: () {
                _getNextNumber();
              }
            ),
            RoundedButton(
              title: 'House Called',
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckScreen(
                    calledNumbers: calledNumbers,
                  )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

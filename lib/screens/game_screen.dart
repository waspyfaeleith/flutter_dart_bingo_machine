//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_fun_app/components/rounded_button.dart';
import 'package:my_fun_app/models/game_data.dart';
import 'package:my_fun_app/screens/check_screen.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {

  //GameScreen({this.title});

  static String id = 'game_screen';
  //final String title;


//   @override
//   _GameScreenState createState() => _GameScreenState();
// }
//
// class _GameScreenState extends State<GameScreen> {

  // var numbers = new List<int>.generate(90, (i) => i + 1);
  //
  // var calledNumbers = List.filled(90, 0);
  // int calledNumber = 0;
  //
  // void _reset() {
  //   setState(() {
  //     numbers = new List<int>.generate(90, (i) => i + 1);
  //     calledNumbers = List.filled(90, 0);
  //     calledNumber = 0;
  //   });
  // }
  //
  // void _getNextNumber() {
  //   setState(() {
  //     var rand = new Random();
  //     int index = rand.nextInt(numbers.length);
  //     calledNumber = numbers.removeAt(index);
  //     calledNumbers[calledNumber - 1] = calledNumber;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A Simple Bingo Machine'),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Provider.of<GameData>(context).calledNumber == 0  ? 'Eyes Down...' : '${Provider.of<GameData>(context).calledNumber}',
              style: Theme.of(context).textTheme.headline1,
            ),
            RoundedButton(
                title: 'Get Number',
                color: Colors.lightGreen,
                onPressed: () {
                  Provider.of<GameData>(context, listen: false).getNextNumber();
                }
            ),
            RoundedButton(
              title: 'House Called',
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, CheckScreen.id);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => CheckScreen(
                //     calledNumbers: calledNumbers,
                //     resetGameCallback: _reset,
                //   )),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
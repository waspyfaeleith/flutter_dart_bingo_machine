//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_fun_app/components/rounded_button.dart';
import 'package:my_fun_app/models/game_data.dart';
import 'package:my_fun_app/screens/check_screen.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {

  static String id = 'game_screen';

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
              },
            ),
          ],
        ),
      ),
    );
  }
}
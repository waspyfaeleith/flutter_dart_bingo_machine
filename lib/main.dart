import 'package:flutter/material.dart';
import 'package:my_fun_app/models/game_data.dart';
import 'package:my_fun_app/screens/check_screen.dart';
import 'package:my_fun_app/screens/game_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BingoMachine());
}

class BingoMachine extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameData(),
      child: MaterialApp(
      initialRoute: GameScreen.id,
      routes: {
          GameScreen.id: (context) => GameScreen(),
          CheckScreen.id: (context) => CheckScreen(),
      }),
    );
  }
}


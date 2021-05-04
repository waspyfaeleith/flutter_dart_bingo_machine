import 'package:flutter/material.dart';
import 'package:my_fun_app/models/game_data.dart';
import 'package:provider/provider.dart';

import '../components/rounded_button.dart';

class CheckScreen extends StatelessWidget {

  static String id = 'check_screen';
  //final List<int> calledNumbers;
  //final Function resetGameCallback;

  //CheckScreen({this.calledNumbers, this.resetGameCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Checking Numbers'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                //height: 400.0,
                child: GridView.count(
                  crossAxisCount: 10,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0,
                  childAspectRatio: 3,
                  padding: EdgeInsets.all(3),
                  shrinkWrap: true,
                  children: List.generate(90, (index) {
                    int number = index + 1;
                    List<int> calledNumbers = Provider.of<GameData>(context).calledNumbers;
                    if (calledNumbers.contains(number)) {
                      return Text(
                          '$number',
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                      );
                    } else {
                    return Text(
                        '$number',
                        style: TextStyle(color: Colors.black87)
                    );
                    }
                  },),
                ),
              ),
              RoundedButton(
                title: 'Return to game',
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              RoundedButton(
                title: 'New Game',
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Provider.of<GameData>(context, listen: false).reset();
                  Navigator.pop(context);
                },
              ),
        ],
      ),
    ),
    );
  }
}

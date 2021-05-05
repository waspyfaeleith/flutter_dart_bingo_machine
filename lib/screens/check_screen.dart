import 'package:flutter/material.dart';
import 'package:my_fun_app/components/rounded_button.dart';
import 'package:my_fun_app/models/game_data.dart';
import 'package:provider/provider.dart';

class CheckScreen extends StatelessWidget {

  static String id = 'check_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Checking Numbers'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 10,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 0.5,
                    childAspectRatio: 1,
                    padding: EdgeInsets.all(8),
                    shrinkWrap: true,
                    children: List.generate(90, (index) {
                      int number = index + 1;
                      List<int> calledNumbers = Provider.of<GameData>(context).calledNumbers;
                      if (calledNumbers.contains(number)) {
                        return Text(
                            '$number',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold
                          )
                        );
                      } else {
                      return Text(
                          '$number',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey
                          )
                      );
                      }
                    },),
                  ),
                ),
                Text(
                  'House called on ${Provider.of<GameData>(context).calledNumber}'
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
    ),
    );
  }
}

import 'package:flutter/material.dart';

import 'components/rounded_button.dart';

class CheckScreen extends StatelessWidget {

  final List<int> calledNumbers;

  CheckScreen({this.calledNumbers});

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
        ],
      ),
    ),
    );
  }
}

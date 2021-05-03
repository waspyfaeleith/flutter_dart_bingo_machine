import 'package:flutter/material.dart';

class CheckScreen extends StatelessWidget {

  List<int> calledNumbers;

  CheckScreen({this.calledNumbers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Checking Numbers'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
              '$calledNumbers',
              ),
              // GridView.count(
              //   crossAxisCount: 10,
              //   children: List.generate(20, (index) {
              //     return Center(
              //       child: Text(
              //         '${index + 1}',
              //         //style: Theme.of(context).textTheme.headline5,
              //       ),
              //     );
              //   }),
              // ),
          FlatButton(
            child: Text('Return to game'),
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

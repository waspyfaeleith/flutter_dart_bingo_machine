import "package:flutter/material.dart";

class BingoBall extends StatelessWidget {

  final String text;

  BingoBall( { required this.text });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //height: 200,
        // width: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
            scale: 400,
            image: AssetImage(
              'images/bingo_ball.png',
            ),
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            '$text',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 80,
              color: Color(0xFF174520),
            ),
          ),
        ),
      ),
    );
  }
}
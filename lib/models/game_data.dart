import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';

class GameData extends ChangeNotifier {
  List<int> _numbers = new List<int>.generate(90, (i) => i + 1);

  List<int> _calledNumbers = List.filled(90, 0);
  int _calledNumber = 0;

  UnmodifiableListView<int> get calledNumbers {
    return UnmodifiableListView(this._calledNumbers);
  }

  void reset() {
      _numbers = new List<int>.generate(90, (i) => i + 1);
      _calledNumbers = List.filled(90, 0);
      _calledNumber = 0;
      notifyListeners();
  }

  void getNextNumber() {
      var rand = new Random();
      int index = rand.nextInt(_numbers.length);
      _calledNumber = _numbers.removeAt(index);
      _calledNumbers[calledNumber - 1] = _calledNumber;
      notifyListeners();
  }

  int get calledNumber {
    return this._calledNumber;
  }
}
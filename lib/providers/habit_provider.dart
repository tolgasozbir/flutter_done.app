import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit_model.dart';

class HabitProvider extends ChangeNotifier {
  
  List<Habit> _habitList = [
    Habit(habitTitle: "Exercise",elapsedTime: 0,timeGoal: 20,isStarted: false),
    Habit(habitTitle: "Work",elapsedTime: 0,timeGoal: 20,isStarted: false),
  ];

  List<Habit> get getHabitList => _habitList;

  bool getHabitStatus(int index) => _habitList[index].isStarted;
  int getElapsedTime(int index) => _habitList[index].elapsedTime;

  void changeHabitStatus(int index) {
    _habitList[index].isStarted = !_habitList[index].isStarted;
    notifyListeners();
  }

  void incrementElsapsedTime(int index){
    _habitList[index].elapsedTime++;
    notifyListeners();
  }

  void startTimer(int index){ //çalışıyor ama hepsi aynı zamanda ticklerse güzel olur
    Timer.periodic(Duration(seconds: 1), (timer) {
      if ( _habitList[index].isStarted) {
        incrementElsapsedTime(index);
      }else{
        timer.cancel();
      }
    });
  }

}
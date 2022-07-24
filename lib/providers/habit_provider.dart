import 'dart:async';
import 'package:flutter/material.dart';
import '../models/habit_model.dart';

class HabitProvider extends ChangeNotifier {
  
  List<Habit> _habitList = [
    Habit(habitTitle: "Exercise",elapsedTime: 0,timeGoal: 18900,isStarted: false),
    Habit(habitTitle: "Work",elapsedTime: 0,timeGoal: 450,isStarted: false),
  ];

  List<Habit> get getHabitList => _habitList;
  bool getStatus(int index) => _habitList[index].isStarted;
  int getElapsedTime(int index) => _habitList[index].elapsedTime;

  void addNewHabit(Habit habit){
    _habitList.add(habit);
    notifyListeners();
  }

  void changeStatus(int index) {
    bool isFinished = _habitList[index].elapsedTime >= _habitList[index].timeGoal;
    if (!isFinished) {
      _habitList[index].isStarted = !_habitList[index].isStarted;
    }else{
      _habitList[index].isStarted = false;
      _habitList[index].elapsedTime = _habitList[index].timeGoal;
      _habitList[index].elapsedTime = 0;
    }
    notifyListeners();
  }

  void startTimer(int index){
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      if ( _habitList[index].isStarted) {
        _incrementElsapsedTime(index);
        if (_habitList[index].elapsedTime >= _habitList[index].timeGoal) {
          timer.cancel();
        }
      }else{
        timer.cancel();
      }
    });
  }

  void _incrementElsapsedTime(int index){
    _habitList[index].elapsedTime++;
    notifyListeners();
  }

  double calculatePercent(int index){
    double percent = _habitList[index].elapsedTime*100/_habitList[index].timeGoal;
    return percent;
  }

  String formatElapsedTime(int seconds){
    String time = '${Duration(seconds: seconds)}'.split('.')[0].padLeft(8, '0');

    if (time.startsWith('00:0')) {
      time = time.substring(4);
    }else if (time.startsWith('00:')) {
      time = time.substring(3);
    }else if (time.startsWith('0')) {
      time = time.substring(1);
    }
    return time;
  }

  String formatGoalTime(int seconds) {
    String time = '${Duration(seconds: seconds)}'.split('.')[0].padLeft(8, '0');

    if (seconds >= 3600) {
      if (time.startsWith('0',0)) {
        time = time.substring(1,time.length-3);
      }else{
        time = time.substring(0,time.length-3);
      }
      if (time.endsWith(':00')) {
        time = time.substring(0,time.length-3);
      }
      time += " Hours";
    } else {
      time = time.substring(3,time.length-3);
      if (time.startsWith('0',0)) {
        time = time.substring(1);
      }
      time += " Mins";
    }

    return time;
  }

}
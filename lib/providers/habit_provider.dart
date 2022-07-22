import 'dart:async';
import 'package:flutter/material.dart';
import '../models/habit_model.dart';

class HabitProvider extends ChangeNotifier {
  
  List<Habit> _habitList = [
    Habit(habitTitle: "Exercise",elapsedTime: 0,timeGoal: 20,isStarted: false),
    Habit(habitTitle: "Work",elapsedTime: 0,timeGoal: 5,isStarted: false),
  ];

  List<Habit> get getHabitList => _habitList;
  bool getHabitStatus(int index) => _habitList[index].isStarted;
  int getElapsedTime(int index) => _habitList[index].elapsedTime;

  void addNewHabit(Habit habit){
    _habitList.add(habit);
    notifyListeners();
  }

  void changeHabitStatus(int index) {
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

  void startTimer(int index){ //çalışıyor ama hepsi aynı zamanda ticklerse güzel olur
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
}
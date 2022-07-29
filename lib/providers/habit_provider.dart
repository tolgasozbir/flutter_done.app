import 'dart:async';
import 'package:flutter/material.dart';
import '../services/notification_service/local_notification_service.dart';
import '../constants/hive_constants.dart';
import '../models/habit_model.dart';
import '../services/cache_service/cache_service.dart';
import '../services/cache_service/habit_cache_service.dart';

class HabitProvider extends ChangeNotifier {

  late ICacheService<Habit> _cacheService;
  
  Future<void> initCacheService() async {
    _cacheService = HabitCacheService(HiveConstants.habitBoxName);
    _cacheService.registerAdapters();
    await _cacheService.init();

    _habitList = _cacheService.getValues() ?? [];
    setTimer();
    calculateElapsedTime();
  } 

  void calculateElapsedTime(){
    var currentDate = DateTime.now();
    for (var item in _habitList) {
      if (item.isStarted) {
        Duration diff = currentDate.difference(item.startTime!);
        item.elapsedTime += diff.inSeconds;
        if (item.elapsedTime >= item.timeGoal) {
          item.elapsedTime = item.timeGoal-1;
        }
      }
    }
  }

  List<Habit> _habitList = [];

  List<Habit> get getHabitList => _habitList;
  bool getStatus(int index) => _habitList[index].isStarted;
  int getElapsedTime(int index) => _habitList[index].elapsedTime;


  void addNewHabit(Habit habit){
    _habitList.add(habit);
    _cacheService.putItem(habit.habitTitle, habit);
    notifyListeners();
  }

  void updateHabit(Habit habit, int index){
    _habitList[index] = habit;
    _cacheService.putItem(habit.habitTitle, habit);
    notifyListeners();
  }

  void deleteHabit(Habit habit){
    _habitList.remove(habit);
    _cacheService.removeItem(habit.habitTitle);
    notifyListeners();
  }

  void changeStatus(int index) {
    bool isFinished = _habitList[index].elapsedTime >= _habitList[index].timeGoal;
    if (isFinished) {
      _habitList[index].isStarted = false;
      _habitList[index].elapsedTime = _habitList[index].timeGoal;
      _habitList[index].elapsedTime = 0;
      _habitList[index].startTime = null;
    }else{
      _habitList[index].isStarted = !_habitList[index].isStarted;
      _habitList[index].isStarted
        ? _habitList[index].startTime = DateTime.now()
        : _habitList[index].startTime = null;
    }
    _cacheService.putItem(_habitList[index].habitTitle, _habitList[index]);
    notifyListeners();
  }

  void setTimer(){
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      for (var item in _habitList) {
        bool isReached = item.elapsedTime >= item.timeGoal;
        if (item.isStarted) {
          item.elapsedTime++;
          notifyListeners();
          if (isReached) {
            item.isStarted = false;
            item.elapsedTime = item.timeGoal;
            LocalNotificationService.instance.showNotification(
              title: "Congratz",
              body: "${item.habitTitle} completed. Keep going!"
            );
          }
        }
      }
    });
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
import 'package:done_app/models/goal_model.dart';
import 'package:flutter/material.dart';

class GoalProvider extends ChangeNotifier {

  List<Goal> _goalList = [];

  List<Goal> get getGoalList => _goalList;

  void addNewGoal(Goal goal) async {
    _goalList.add(goal);
    notifyListeners();
  }  
  
  void addTask(String task) async {
    notifyListeners();
  }

  void updateGoal() async { // tasklerde eklencek

  }

  void deleteGoal() async {

  }



}
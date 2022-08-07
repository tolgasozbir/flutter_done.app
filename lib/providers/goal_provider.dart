import 'package:done_app/models/goal_model.dart';
import 'package:done_app/services/cache_service/cache_service.dart';
import 'package:done_app/services/cache_service/goal_cache_service.dart';
import 'package:flutter/material.dart';
import '../constants/hive_constants.dart';


class GoalProvider extends ChangeNotifier {

  late ICacheService<Goal> _cacheService;
  
  Future<void> initCacheService() async {
    _cacheService = GoalCacheService(HiveConstants.goalBoxName);
    _cacheService.registerAdapters();
    await _cacheService.init();
    _goalList = _cacheService.getValues() ?? [];
  } 

  List<Goal> _goalList = [];

  List<Goal> get getGoalList => _goalList;

  Goal? _lastClickedGoal;
  Goal? get lastClickedGoal => _lastClickedGoal;

  void changeClickedGoal(Goal goal){
    _lastClickedGoal = goal;
  }

  void addNewGoal(Goal goal) async {
    _goalList.add(goal);
    await _cacheService.putItem(goal.goalTitle, goal);
    notifyListeners();
  }

  void deleteGoal(Goal goal) async {
    _goalList.remove(goal);
    await _cacheService.removeItem(goal.goalTitle);
    notifyListeners();
  }
  
  void addTask(String task, Goal goal) async {
    var item = _goalList.firstWhere((e) => e.goalTitle == goal.goalTitle);
    item.tasks.add(Task(taskTitle: task, isComplete: false));
    calculatePercentComplete(item);
    await _cacheService.putItem(item.goalTitle, item);
    notifyListeners();
  }

  void deleteTask(int taskIndex, Goal goal) async {
    var item = _goalList.firstWhere((e) => e.goalTitle == goal.goalTitle);
    item.tasks.removeAt(taskIndex);
    calculatePercentComplete(item);
    await _cacheService.putItem(item.goalTitle, item);
    notifyListeners();
  }  
  
  void changeTaskCheck(int taskIndex, bool isChecked, Goal goal) async {
    var item = _goalList.firstWhere((e) => e.goalTitle == goal.goalTitle);
    item.tasks[taskIndex].isComplete = isChecked;
    calculatePercentComplete(item);
    await _cacheService.putItem(item.goalTitle, item);
    notifyListeners();
  }

  void completeGoal(Goal goal) async {
    var item = _goalList.firstWhere((e) => e == goal);
    item.goalIsComplete = true;
    await _cacheService.putItem(item.goalTitle, item);
    notifyListeners();
  }

  void calculatePercentComplete(Goal goal){
    int totalTaksCount = goal.tasks.length;
    int totalCompletedTasks = goal.tasks.where((e) => e.isComplete == true).length;
    double percent = totalCompletedTasks*100/totalTaksCount;
    goal.goalCompletionPercentage = percent.isNaN ? 0 : percent;
  }

}
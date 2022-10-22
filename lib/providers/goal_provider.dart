import 'package:flutter/material.dart';
import '../constants/hive_constants.dart';
import '../models/goal_model.dart';
import '../services/cache_service/cache_service.dart';
import '../services/cache_service/goal_cache_service.dart';


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
  
  void undoGoal(Goal goal) async {
    var item = _goalList.firstWhere((e) => e == goal);
    item.goalIsComplete = false;
    await _cacheService.putItem(item.goalTitle, item);
    notifyListeners();
  }

  void calculatePercentComplete(Goal goal){
    int totalTaksCount = goal.tasks.length;
    int totalCompletedTasks = goal.tasks.where((e) => e.isComplete == true).length;
    double percent = totalCompletedTasks*100/totalTaksCount;
    goal.goalCompletionPercentage = percent.isNaN ? 0 : percent;
  }

  double calculateStatsCompletePercent(){
    int totalGoals = _goalList.length;
    int totalTasks = _goalList.fold<int>(0, (previousValue, element) => element.tasks.length + previousValue);
    int completedGoals = _goalList.where((e) => e.goalIsComplete).length;
    int completedTasks = _goalList.fold<int>(0, (previousValue, element) => element.tasks.where((element) => element.isComplete).length + previousValue);
  
    int totalCount = totalGoals + totalTasks;
    int totalCompleteCount = completedGoals + completedTasks;
    
    double percent = totalCompleteCount*100/totalCount;
    return percent;
  }

  List<Task> sortTasks(Goal goal, bool ascending){
    List<Task> tasks = goal.tasks;
    tasks.sort((a, b) {
      return ascending 
        ? a.taskTitle.compareTo(b.taskTitle)
        : b.taskTitle.compareTo(a.taskTitle);
    });
    notifyListeners();
    return tasks;
  }

  List<Task> sortByCheckedTask(Goal goal, bool checked){
    List<Task> tasks = goal.tasks;
    tasks.sort((a, b) {
      return checked
        ? b.isComplete.toString().compareTo(a.isComplete.toString())
        : a.isComplete.toString().compareTo(b.isComplete.toString());
    });
    notifyListeners();
    return tasks;
  }

}
import 'package:done_app/models/task_model.dart';
import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {

  List<Task> _taskList = [];

  List<Task> get taskList => _taskList;

  void addNewTask(Task task) async {
    _taskList.add(task);
    notifyListeners();
  }

  void updateTask() async {

  }

  void deleteTask() async {

  }



}
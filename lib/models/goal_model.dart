// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:done_app/constants/hive_constants.dart';

part 'goal_model.g.dart';

@HiveType(typeId: HiveConstants.goalTypeId)
class Goal {

  @HiveField(0)
  late int id;
  @HiveField(1)
  late String goalTitle;
  @HiveField(2)
  late String goalDescription;
  @HiveField(3)
  late double goalCompletionPercentage;
  @HiveField(4)
  late IconData goalIconData;
  @HiveField(5)
  late Color goalColor;
  @HiveField(6)
  late bool isComplete;  
  @HiveField(7)
  List<Task> tasks = [];

  Goal({
    required this.id,
    required this.goalTitle,
    required this.goalDescription,
    this.goalCompletionPercentage = 0,
    required this.goalIconData,
    required this.goalColor,
    this.isComplete = false,
  });
}

@HiveType(typeId: HiveConstants.taskTypeId)
class Task {
  @HiveField(0)
  String taskTitle;
  @HiveField(1)
  bool isComplete;

  Task({
    required this.taskTitle,
    required this.isComplete,
  });
}

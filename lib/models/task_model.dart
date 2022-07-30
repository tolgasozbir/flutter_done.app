import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/hive_constants.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: HiveConstants.taskTypeId)
class Task {

  @HiveField(0)
  late String taskTitle;
  @HiveField(1)
  late String taskDescription;
  @HiveField(2)
  late int taskCount;
  @HiveField(3)
  late double taskCompletionPercentage;
  @HiveField(4)
  late IconData taskIconData;
  @HiveField(5)
  late Color taskColor;

  Task({
    required this.taskTitle,
    required this.taskDescription,
    required this.taskCount,
    required this.taskCompletionPercentage,
    required this.taskIconData,
    required this.taskColor,
  });
}

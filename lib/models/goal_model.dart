import 'package:done_app/constants/hive_constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'goal_model.g.dart';

@HiveType(typeId: HiveConstants.goalTypeId)
class Goal {

  @HiveField(0)
  late String goalTitle;
  @HiveField(1)
  late String goalDescription;
  @HiveField(2)
  late int taskCount;
  @HiveField(3)
  late double goalCompletionPercentage;
  @HiveField(4)
  late IconData goalIconData;
  @HiveField(5)
  late Color goalColor;
  @HiveField(6)
  late bool isComplete;  
  @HiveField(7)
  List<String> tasks = [];

  Goal({
    required this.goalTitle,
    this.goalDescription = '',
    this.taskCount = 0,
    this.goalCompletionPercentage = 0,
    required this.goalIconData,
    required this.goalColor,
    this.isComplete = false,
  });
}

import 'package:hive/hive.dart';

import 'package:done_app/constants/hive_constants.dart';

part 'goal_model.g.dart';

@HiveType(typeId: HiveConstants.goalTypeId)
class Goal {

  @HiveField(0)
  late String goalTitle;
  @HiveField(1)
  late String goalDescription;
  @HiveField(2)
  late double goalCompletionPercentage;
  @HiveField(3)
  late int goalIconDataIndex;
  @HiveField(4)
  late int goalColorIndex;
  @HiveField(5)
  late bool goalIsComplete;  
  @HiveField(6)
  List<Task> tasks = [];

  Goal({
    required this.goalTitle,
    required this.goalDescription,
    this.goalCompletionPercentage = 0,
    required this.goalIconDataIndex,
    required this.goalColorIndex,
    this.goalIsComplete = false,
  });

  @override
  bool operator ==(covariant Goal other) {
    if (identical(this, other)) return true;
    return other.goalTitle == goalTitle;
  }
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

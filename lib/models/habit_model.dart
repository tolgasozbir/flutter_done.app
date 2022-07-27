import 'package:habit_tracker/constants/hive_constants.dart';
import 'package:hive/hive.dart';

part 'habit_model.g.dart';

@HiveType(typeId: HiveConstants.habitTypeId)
class Habit {
  
  @HiveField(0)
  late String habitTitle;
  @HiveField(1)
  late int elapsedTime;
  @HiveField(2)
  late int timeGoal;
  @HiveField(3)
  late bool isStarted;

  Habit({
    required this.habitTitle,
    required this.elapsedTime,
    required this.timeGoal,
    this.isStarted = false,
  });

  Habit.fromJson(Map<String, dynamic> json) {
    habitTitle = json['habitTitle'];
    elapsedTime = json['elapsedTime'];
    timeGoal = json['timeGoal'];
    isStarted = json['isStarted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['habitTitle'] = this.habitTitle;
    data['elapsedTime'] = this.elapsedTime;
    data['timeGoal'] = this.timeGoal;
    data['isStarted'] = this.isStarted;
    return data;
  }
}

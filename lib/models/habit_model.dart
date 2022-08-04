import '../constants/hive_constants.dart';
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
  late int mins;
  @HiveField(4)
  late int hours;
  @HiveField(5)
  late bool isStarted;  
  @HiveField(6)
  late DateTime? startTime;

  Habit({
    required this.habitTitle,
    required this.elapsedTime,
    required this.timeGoal,
    this.isStarted = false,
    this.startTime,
    this.hours = 0,
    this.mins = 0,
  });
}

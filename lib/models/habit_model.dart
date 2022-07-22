class Habit {
  late String habitTitle;
  late int elapsedTime;
  late int timeGoal;
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/habit_model.dart';
import '../../../providers/habit_provider.dart';
import '../../../widgets/habit_tile.dart';

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Habit> habitList = context.watch<HabitProvider>().getHabitList;
    return ListView.builder(
      itemCount: habitList.length,
      itemBuilder: (BuildContext context, int index) {
        Habit habit = habitList[index];
        return HabitTile(habit: habit, index: index);
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/habit_model.dart';
import '../../../providers/habit_provider.dart';
import '../../../widgets/empty_widget.dart';
import '../../../widgets/habit_widgets/habit_tile.dart';

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Habit> habitList = context.watch<HabitProvider>().getHabitList;
    return habitList.isEmpty
      ? const EmptyWidget(emptyLottie: EmptyLottie.astronaut2,)
      : habitListView(habitList);
  }

  ListView habitListView(List<Habit> habitList) {
    return ListView.builder(
    itemCount: habitList.length,
    itemBuilder: (BuildContext context, int index) {
      Habit habit = habitList[index];
      return HabitTile(habit: habit, index: index);
    },
  );
  }
}
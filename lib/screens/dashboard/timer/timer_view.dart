import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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

  Widget habitListView(List<Habit> habitList) {
    return AnimationLimiter(
      child: ListView.builder(
      itemCount: habitList.length,
      itemBuilder: (BuildContext context, int index) {
        Habit habit = habitList[index];
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 600),
          child: SlideAnimation(
            verticalOffset: -20,
            child: FadeInAnimation(
              child: HabitTile(habit: habit, index: index),
            ),
          ),
        );
      },
      ),
    );
  }
}
import 'package:done_app/providers/goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:done_app/models/goal_model.dart';
import 'package:provider/provider.dart';
import '../../../widgets/empty_widget.dart';
import '../../../widgets/goal_widgets/goal_grid_view.dart';

class GoalsView extends StatelessWidget  {
  const GoalsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Goal> goalUnCompletedList = context.watch<GoalProvider>().getGoalList.where((e) => !e.goalIsComplete).toList();
    return goalUnCompletedList.isEmpty
      ? const EmptyWidget(emptyLottie: EmptyLottie.astronaut1,)
      : GoalGridView(goalList: goalUnCompletedList);
  }
}
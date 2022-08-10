import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/goal_model.dart';
import '../../../providers/goal_provider.dart';
import '../../../widgets/empty_widget.dart';
import '../../../widgets/goal_widgets/goal_grid_view.dart';

class ClosedGoalsView extends StatelessWidget {
  const ClosedGoalsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Goal> goalCompletedList = context.watch<GoalProvider>().getGoalList.where((e) => e.goalIsComplete).toList();
    return goalCompletedList.isEmpty
      ? const EmptyWidget(emptyLottie: EmptyLottie.astronaut1,)
      : GoalGridView(goalList: goalCompletedList);
  }
}
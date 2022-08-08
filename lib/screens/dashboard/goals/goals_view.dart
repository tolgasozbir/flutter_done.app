import 'package:done_app/constants/app_styles.dart';
import 'package:done_app/providers/goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:done_app/models/goal_model.dart';
import 'package:provider/provider.dart';
import '../../../widgets/goal_widgets/goal_progress_card.dart';

class GoalsView extends StatelessWidget  {
  const GoalsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Goal> goalList = context.watch<GoalProvider>().getGoalList;
    return GridView.builder(
      padding: AppPaddings.all8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: goalList.where((e) => !e.goalIsComplete).toList().length,
      itemBuilder: (BuildContext context, int index) {
        Goal goal = goalList.where((e) => !e.goalIsComplete).toList()[index];
        return GoalProgressCard(
          goal: goal
        );
      },
    );
  }
}
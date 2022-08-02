import 'package:done_app/providers/goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:done_app/models/goal_model.dart';
import 'package:provider/provider.dart';
import '../../../widgets/goal_widgets/goal_progress_card.dart';

class GoalsView extends StatelessWidget  {
  const GoalsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: context.watch<GoalProvider>().getGoalList.length,
      itemBuilder: (BuildContext context, int index) {
        Goal goal = context.watch<GoalProvider>().getGoalList[index];
        return GoalProgressCard(
          goal: goal
        );
      },
    );
  }
}
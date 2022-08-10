import 'package:done_app/models/goal_model.dart';
import 'package:flutter/material.dart';

import '../../constants/app_styles.dart';
import 'goal_progress_card.dart';

class GoalGridView extends StatelessWidget {
  const GoalGridView({Key? key, required this.goalList}) : super(key: key);

  final List<Goal> goalList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: AppPaddings.all8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: goalList.length,
      itemBuilder: (BuildContext context, int index) {
        Goal goal = goalList[index];
        return GoalProgressCard(
          goal: goal
        );
      }
    );
  }
}
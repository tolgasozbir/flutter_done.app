import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../constants/app_styles.dart';
import '../../models/goal_model.dart';
import 'goal_progress_card.dart';

class GoalGridView extends StatelessWidget {
  const GoalGridView({Key? key, required this.goalList}) : super(key: key);

  final List<Goal> goalList;
  final int columnCount = 2;
  final double spacing = 8.0;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        padding: AppPaddings.all8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
        itemCount: goalList.length,
        itemBuilder: (BuildContext context, int index) {
          Goal goal = goalList[index];
          return AnimationConfiguration.staggeredGrid(
            position: index,
            columnCount: columnCount,
            duration: const Duration(milliseconds: 600),
            child: ScaleAnimation(
              child: ScaleAnimation(
                child: GoalProgressCard(
                  goal: goal
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
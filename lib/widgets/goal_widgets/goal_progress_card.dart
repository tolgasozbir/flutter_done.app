import 'package:auto_route/auto_route.dart';
import 'package:done_app/widgets/scaled_text.dart';
import 'package:flutter/material.dart';
import 'package:done_app/constants/app_strings.dart';
import 'package:done_app/constants/app_styles.dart';
import 'package:done_app/extensions/widget_extension.dart';
import 'package:done_app/models/goal_model.dart';
import '../../routes/app_router.dart';
import 'circular_arc_progress.dart';

class GoalProgressCard extends StatelessWidget {
  const GoalProgressCard({Key? key, required this.goal}) : super(key: key);

  final Goal goal;
  final double iconSize = 32;
  final double titleTextSize = 20;
  final double taskCountTextSize = 16;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.router.push(GoalDetailRoute(goal: goal));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppRadius.all16,
          border: Border.all(color: goal.goalColor, width: 2)
        ),
        child: Stack(
          children: [
            arcProgress(),
            Icon(goal.goalIconData, size: iconSize).wrapPadding(AppPaddings.all4),
            goalTitleAndTaskCount(),
          ],
        )
      ),
    );
  }

  Widget arcProgress() {
    return CircularArc(
      progressPercent: goal.goalCompletionPercentage,
      progressColor: goal.goalColor,
    ).wrapPadding(AppPaddings.arcGridPadding);
  }

  Widget goalTitleAndTaskCount() {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          ScaledText(
            text: '${goal.goalTitle}',
            style: AppTextStyles.boldCustomSize(fontSize: titleTextSize),
            textAlign: TextAlign.center,
          ),
          ScaledText(
            text: '${goal.tasks.length} ${AppStrings.task}',
            style: AppTextStyles.boldCustomSize(fontSize: taskCountTextSize),
          ).wrapAlign(Alignment.centerLeft),
        ],
      ).wrapAlign(Alignment.bottomCenter).wrapPadding(AppPaddings.goalCardTextPadding),
    );
  }
}
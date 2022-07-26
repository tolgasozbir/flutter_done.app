import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../constants/app_styles.dart';
import '../../constants/goal_icons.dart';
import '../../extensions/widget_extension.dart';
import '../../models/goal_model.dart';
import '../../providers/goal_provider.dart';
import '../../routes/app_router.dart';
import '../custom_snackbar.dart';
import '../scaled_text.dart';
import 'circular_arc_progress.dart';

class GoalProgressCard extends StatelessWidget {
  const GoalProgressCard({Key? key, required this.goal}) : super(key: key);

  final Goal goal;
  final double iconSize = 32;
  final double titleTextSize = 20;
  final double taskCountTextSize = 16;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        dynamic popData;
        if (goal.goalIsComplete) {
          popData = await context.router.push(ClosedGoalDetailRoute(goal: goal));
        }else{
          popData = await context.router.push(GoalDetailRoute(goal: goal));
        }
        await Future.delayed(const Duration(milliseconds: 400));
        switch (popData) {
          case AppStrings.delete:
            context.read<GoalProvider>().deleteGoal(goal);
            return;
          case AppStrings.finish:
            context.read<GoalProvider>().completeGoal(goal);
            return;
            case AppStrings.doIt:
            context.read<GoalProvider>().undoGoal(goal);
            return;
          default: context.read<GoalProvider>().changeClickedGoal(goal);
        }
      },
      onLongPress: () => CustomSnackBar.showSnackBarMessage(
        context: context, 
        text: AppStrings.snackBarMessageDelete,
        actionFunction: () async => context.read<GoalProvider>().deleteGoal(goal),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppRadius.all16,
          border: Border.all(color: AppColors.goalColors[goal.goalColorIndex], width: 2)
        ),
        child: Stack(
          children: [
            arcProgress(),
            Icon(GoalIcons.goalIconList[goal.goalIconDataIndex], size: iconSize).wrapPadding(AppPaddings.all4),
            goalTitleAndTaskCount(),
          ],
        )
      ),
    );
  }

  Widget arcProgress() {
    return CircularArc(
      progressPercent: goal.goalCompletionPercentage,
      progressColor: AppColors.goalColors[goal.goalColorIndex],
    ).wrapPadding(AppPaddings.arcGridPadding);
  }

  Widget goalTitleAndTaskCount() {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          ScaledText(
            text: goal.goalTitle,
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
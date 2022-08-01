import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:done_app/constants/app_strings.dart';
import 'package:done_app/constants/app_styles.dart';
import 'package:done_app/extensions/widget_extension.dart';
import 'package:done_app/models/task_model.dart';
import '../../routes/app_router.dart';
import 'circular_arc_progress.dart';

class TaskProgressCard extends StatelessWidget {
  const TaskProgressCard({Key? key, required this.task}) : super(key: key);

  final Task task;
  final double iconSize = 32;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.router.push(GoalDetailRoute(task: task));
      },
      child: Container(
        decoration: AppDecorations.taskProgressCardDecoration(task.taskColor),
        child: Stack(
          children: [
            arcProgress(),
            Icon(task.taskIconData, size: iconSize).wrapPadding(AppPaddings.all4),
            taskTitleAndCount(),
          ],
        )
      ),
    );
  }

  Widget arcProgress() {
    return CircularArc(
      progressPercent: task.taskCompletionPercentage,
      progressColor: task.taskColor,
    ).wrapPadding(AppPaddings.arcGridPadding);
  }

  Widget taskTitleAndCount() {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Text("${task.taskTitle}", style: AppTextStyles.generalTextStyle ,textAlign: TextAlign.center),
          Text("${task.taskCount} ${AppStrings.task}").wrapAlign(Alignment.centerLeft),
        ],
      ).wrapAlign(Alignment.bottomCenter).wrapPadding(AppPaddings.taskCardTextPadding),
    );
  }
}
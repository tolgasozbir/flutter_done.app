import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/app_strings.dart';
import 'package:habit_tracker/constants/app_styles.dart';
import 'package:habit_tracker/extensions/widget_extension.dart';
import 'package:habit_tracker/models/task_model.dart';
import 'package:habit_tracker/screens/task_detail_view.dart';
import 'package:habit_tracker/utilities/route_helper.dart';

import 'circular_arc_progress.dart';

class TaskProgressCard extends StatelessWidget {
  const TaskProgressCard({Key? key, required this.task}) : super(key: key);

  final Task task;
  final double iconSize = 32;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        RouteHelper.goRoute(context: context, page: TaskDetailView(task: task));
      },
      child: Container(
        decoration: AppDecorations.TaskProgressCardDecoration(task.taskColor),
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
          Text("${task.taskCount} ${AppStrings.taskText}").wrapAlign(Alignment.centerLeft),
        ],
      ).wrapAlign(Alignment.bottomCenter).wrapPadding(AppPaddings.taskCardTextPadding),
    );
  }
}
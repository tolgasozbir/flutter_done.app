import 'package:flutter/material.dart';
import 'package:habit_tracker/extensions/widget_extension.dart';
import 'package:habit_tracker/models/task_model.dart';
import 'package:habit_tracker/screens/task_detail_view.dart';
import 'package:habit_tracker/utilities/route_helper.dart';

import 'circular_arc_progress.dart';

class TaskProgressCard extends StatelessWidget {
  const TaskProgressCard({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        RouteHelper.goRoute(context: context, page: TaskDetailView(task: task));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: task.taskColor, width: 2)
        ),
        child: Stack(
          children: [
            arcProgress(),
            Icon(task.taskIconData,size: 32).wrapPadding(EdgeInsets.all(4)),
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
    ).wrapPadding(EdgeInsets.symmetric(horizontal: 24,vertical: 16));
  }

  Widget taskTitleAndCount() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text("${task.taskTitle}", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ,textAlign: TextAlign.center,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("${task.taskCount} Tasks")
            )
          ],
        )
      ).wrapPadding(EdgeInsets.only(left: 8,bottom: 8))
    );
  }
}
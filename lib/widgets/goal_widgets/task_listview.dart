import 'package:done_app/extensions/widget_extension.dart';
import 'package:done_app/models/goal_model.dart';
import 'package:done_app/providers/goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({Key? key, required this.goal}) : super(key: key);

  final Goal goal;

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.goal.tasks.length,
      itemBuilder: (BuildContext context, int index) {
        Task task = widget.goal.tasks[index];
        return taskCard(
          index: index,
          taskTitle: task.taskTitle,
          isChecked: task.isComplete,
        );
      },
    );
  }

  Widget taskCard({required String taskTitle,required bool isChecked, required int index}) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.goalColors[widget.goal.goalColorIndex]),
        borderRadius: AppRadius.all16,
      ),
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: checkboxListTile(taskTitle: taskTitle, isChecked: isChecked, index: index)
    ).wrapPadding(AppPaddings.goalTaskCardPadding);
  }

  Widget checkboxListTile({required String taskTitle,required bool isChecked,required int index}) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(taskTitle, style: isChecked ? const TextStyle(decoration: TextDecoration.lineThrough) : null,),
      secondary: IconButton(
        onPressed: (){
          context.read<GoalProvider>().deleteTask(index, widget.goal);
        }, 
        icon: const Icon(Icons.delete)
      ),
      value: isChecked, 
      onChanged: (value){
        context.read<GoalProvider>().changeTaskCheck(index, value!, widget.goal);
      }
    );
  }
}
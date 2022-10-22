import '../../extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';
import '../../models/goal_model.dart';
import '../../providers/goal_provider.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.goal, required this.taskTitle, required this.isChecked, required this.index});

  final Goal goal;
  final String taskTitle;
  final bool isChecked;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.goalColors[goal.goalColorIndex]),
        borderRadius: AppRadius.all16,
      ),
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: checkboxListTile(context, taskTitle: taskTitle, isChecked: isChecked, index: index)
    ).wrapPadding(AppPaddings.goalTaskCardPadding);
  }

  Widget checkboxListTile(BuildContext context, {required String taskTitle,required bool isChecked,required int index}) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(taskTitle, style: isChecked ? const TextStyle(decoration: TextDecoration.lineThrough) : null,),
      secondary: IconButton(
        onPressed: (){
          context.read<GoalProvider>().deleteTask(index, goal);
        }, 
        icon: const Icon(Icons.delete)
      ),
      value: isChecked, 
      onChanged: (value){
        context.read<GoalProvider>().changeTaskCheck(index, value!, goal);
      }
    );
  }
  
}
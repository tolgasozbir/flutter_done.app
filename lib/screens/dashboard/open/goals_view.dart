import 'dart:math';
import 'package:flutter/material.dart';
import 'package:done_app/models/task_model.dart';
import '../../../widgets/goal_widgets/task_progress_card.dart';

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
      itemCount: 12,
      itemBuilder: (BuildContext context, int index) {
        return TaskProgressCard(
          task: Task(
            taskTitle: "Youtube Videos", 
            taskDescription: "Reach 10k subsricber ba ba",
            taskCount: Random().nextInt(100), 
            taskCompletionPercentage: Random().nextDouble()*100, 
            taskIconData: Icons.task_alt, 
            taskColor: Colors.primaries[Random().nextInt(17)]
          ),
        );
      },
    );
  }
}
import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/task_progress_card.dart';

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
          completionPercentage: Random().nextDouble() * 100, 
          taskTitle: "taskTitle", 
          taskCount: Random().nextInt(100).toString(), 
          taskIconData: Icons.task_alt_sharp, 
          borderColor: Colors.primaries[Random().nextInt(17)]
        );
      },
    );
  }
}


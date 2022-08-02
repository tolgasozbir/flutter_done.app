import 'dart:math';
import 'package:flutter/material.dart';
import 'package:done_app/models/goal_model.dart';
import '../../../widgets/goal_widgets/goal_progress_card.dart';

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
        return GoalProgressCard(
          goal: Goal(
            goalTitle: "Youtube Videos", 
            goalDescription: "Reach 10k subsricber ba ba",
            taskCount: Random().nextInt(100), 
            goalCompletionPercentage: Random().nextDouble()*100, 
            goalIconData: Icons.task_alt, 
            goalColor: Colors.primaries[Random().nextInt(17)]
          ),
        );
      },
    );
  }
}
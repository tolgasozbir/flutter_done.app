import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_styles.dart';
import '../../../extensions/widget_extension.dart';
import '../../../providers/goal_provider.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var goalList = context.watch<GoalProvider>().getGoalList;
    int totalGoals = goalList.length;
    int completedGoals = goalList.where((e) => e.goalIsComplete).length;
    int totalTasks = goalList.fold<int>(0, (previousValue, element) => element.tasks.length + previousValue);
    int completedTasks = goalList.fold<int>(0, (previousValue, element) => element.tasks.where((element) => element.isComplete).length + previousValue);
    return Row(
      children: [
        chart('Goals', totalGoals, completedGoals),
        chart('Tasks', totalTasks, completedTasks),
      ],
    ).wrapPadding(AppPaddings.all16);
  }

  Expanded chart(String name, int total, int completed) {
    return Expanded(
      child: BarChart(
        [
          Series(
            id: name, 
            data: [null], 
            domainFn: (_,__) => name, 
            measureFn: (_,__) => total,
          ),
          Series(
            id: "Completed$name", 
            data: [null], 
            domainFn: (_,__) => "Completed", 
            measureFn: (_,__) => completed, 
          )
        ],
        barGroupingType: BarGroupingType.groupedStacked,
      ),
    );
  }
}
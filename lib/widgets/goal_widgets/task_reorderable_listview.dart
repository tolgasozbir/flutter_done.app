import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'task_card.dart';
import '../../models/goal_model.dart';
import 'package:flutter/material.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({Key? key, required this.goal}) : super(key: key);

  final Goal goal;

  @override
  State<TaskListView> createState() => TaskListViewState();
}

class TaskListViewState extends State<TaskListView> {

  List<Task> tasks = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    tasks = widget.goal.tasks;
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ReorderableListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) newIndex--;
          final item = tasks.removeAt(oldIndex);
          tasks.insert(newIndex, item);
          setState(() { });
        },
        children: List.generate(tasks.length, (index) {
          return AnimationConfiguration.staggeredList(
            key: ValueKey(tasks[index]),
            position: index,
            duration: const Duration(milliseconds: 600),
            child: SlideAnimation(
              verticalOffset: -20,
              child: FadeInAnimation(
                child: TaskCard(
                  //key: ValueKey(tasks[index]),
                  goal: widget.goal, 
                  taskTitle: tasks[index].taskTitle, 
                  isChecked: tasks[index].isComplete, 
                  index: index
                ),
              ),
            ),
          );
        }),
        // children: tasks.map((e) => TaskCard(
        //   key: ValueKey(e),
        //   goal: widget.goal, 
        //   taskTitle: e.taskTitle, 
        //   isChecked: e.isComplete, 
        //   index: tasks.indexOf(e)
        // )).toList(),
      ),
    );
  }

}
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
    return ReorderableListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      onReorder: (oldIndex, newIndex) {
        if (newIndex > oldIndex) newIndex--;
        final item = tasks.removeAt(oldIndex);
        tasks.insert(newIndex, item);
        setState(() { });
      },
      children: tasks.map((e) => TaskCard(
        key: ValueKey(e),
        goal: widget.goal, 
        taskTitle: e.taskTitle, 
        isChecked: e.isComplete, 
        index: tasks.indexOf(e)
      )).toList(),
    );
  }

}
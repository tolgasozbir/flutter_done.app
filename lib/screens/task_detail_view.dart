import 'package:flutter/material.dart';
import 'package:habit_tracker/extensions/context_extension.dart';
import 'package:habit_tracker/extensions/widget_extension.dart';
import 'package:habit_tracker/models/task_model.dart';

import '../widgets/circular_arc_progress.dart';

class TaskDetailView extends StatefulWidget {
  const TaskDetailView({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  State<TaskDetailView> createState() => _TaskDetailViewState();
}

class _TaskDetailViewState extends State<TaskDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _bodyView()),
    );
  }

  Widget _bodyView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircularArc(
                  textStyle: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
                  strokeWidth: 42,
                  size: context.dynamicWidth(0.64),
                  progressPercent: widget.task.taskCompletionPercentage,
                  progressColor: widget.task.taskColor,
                ).wrapPadding(EdgeInsets.symmetric(horizontal: 24,vertical: 24)),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      FittedBox(child: Text("${widget.task.taskTitle}", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold) ,textAlign: TextAlign.center,)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: FittedBox(child: Text("${widget.task.taskDescription}", style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold) ,textAlign: TextAlign.center,))
                      ),
                    ],
                  )
                ).wrapPadding(EdgeInsets.only(left: 16,bottom: 16, right: 16))
              ),
            ],
          ),
          Column(
            children: [
              Card(child: CheckboxListTile(value: true, onChanged: (value){})),
              Card(child: CheckboxListTile(value: true, onChanged: (value){})),
              Card(child: CheckboxListTile(value: true, onChanged: (value){})),
              Card(child: CheckboxListTile(value: true, onChanged: (value){})),
              Card(child: CheckboxListTile(value: true, onChanged: (value){})),
              Card(child: CheckboxListTile(value: true, onChanged: (value){})),
              Card(child: CheckboxListTile(value: true, onChanged: (value){})),
              Card(child: CheckboxListTile(value: true, onChanged: (value){})),
            ],
          ),
        ],
      ),
    );
  }
}
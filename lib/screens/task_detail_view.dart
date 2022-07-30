import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/app_styles.dart';
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

  final double arcStroke = 42;
  final double percentSize = 64;
  final double titleSize = 40;
  final double descriptionSize = 32;

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
              arcProgress(),
              taskTitleAndDescription(),
            ],
          ),
          Column(
            children: [
              Card(child: CheckboxListTile(value: true, onChanged: (value){})),
              Card(child: CheckboxListTile(value: true, onChanged: (value){})),
            ],
          ),
        ],
      ),
    );
  }

  Widget arcProgress() {
    return CircularArc(
      textStyle: AppTextStyles.boldCustomSize(percentSize),
      strokeWidth: arcStroke,
      size: context.dynamicWidth(0.64),
      progressPercent: widget.task.taskCompletionPercentage,
      progressColor: widget.task.taskColor,
    ).wrapAlign(Alignment.topCenter).wrapPadding(AppPaddings.arcDetailPadding);
  }

  Positioned taskTitleAndDescription() {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          textCenter(widget.task.taskTitle, titleSize).wrapFitted(),
          textCenter(widget.task.taskDescription, descriptionSize).wrapFitted().wrapAlign(Alignment.centerLeft),
        ],
      ).wrapAlign(Alignment.bottomCenter).wrapPadding(AppPaddings.taskDetailTextPadding)
    );
  }

  Text textCenter(String text, double fontSize) {
    return Text(
      text, 
      style: AppTextStyles.boldCustomSize(fontSize),
      textAlign: TextAlign.center
    );
  }
}
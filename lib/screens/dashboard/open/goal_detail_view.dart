import 'package:flutter/material.dart';
import 'package:done_app/constants/app_styles.dart';
import 'package:done_app/extensions/context_extension.dart';
import 'package:done_app/extensions/widget_extension.dart';
import 'package:done_app/models/task_model.dart';
import '../../../widgets/goal_widgets/circular_arc_progress.dart';

class GoalDetailView extends StatefulWidget {
  const GoalDetailView({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  State<GoalDetailView> createState() => _GoalDetailViewState();
}

class _GoalDetailViewState extends State<GoalDetailView> {

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
    return Column(
      children: [
        Stack(
          children: [
            arcProgress(),
            taskTitleAndDescription(),
          ],
        ),  
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(),
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
            child: ExpansionTile(
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            title: Text("data"),//newMethod(),//TODO: düzenlencek
            children: [
              Text("data"),
              cont(),
            ],
          )
        ) .wrapPadding(EdgeInsets.all(8)),
      ],
    );
  }

  Container cont() {
    return Container(
              color: Colors.amber,
              height: 200,
            );
  }

  CheckboxListTile newMethod() {
    return CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: false, onChanged: (value){});
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
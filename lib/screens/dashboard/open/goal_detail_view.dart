import 'package:flutter/material.dart';
import 'package:done_app/constants/app_styles.dart';
import 'package:done_app/extensions/context_extension.dart';
import 'package:done_app/extensions/widget_extension.dart';
import 'package:done_app/models/goal_model.dart';
import '../../../widgets/goal_widgets/circular_arc_progress.dart';

class GoalDetailView extends StatefulWidget {
  const GoalDetailView({Key? key, required this.goal}) : super(key: key);

  final Goal goal;

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
            goalTitleAndDescription(),
          ],
        ),  
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(),
              borderRadius: AppRadius.all16,
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
      progressPercent: widget.goal.goalCompletionPercentage,
      progressColor: widget.goal.goalColor,
    ).wrapAlign(Alignment.topCenter).wrapPadding(AppPaddings.all24);
  }

  Positioned goalTitleAndDescription() {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          textCenter(widget.goal.goalTitle, titleSize).wrapFitted(),
          textCenter(widget.goal.goalDescription, descriptionSize).wrapFitted().wrapAlign(Alignment.centerLeft),
        ],
      ).wrapAlign(Alignment.bottomCenter).wrapPadding(AppPaddings.goalDetailTextPadding)
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
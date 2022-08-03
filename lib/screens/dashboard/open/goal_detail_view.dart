import 'package:done_app/constants/app_colors.dart';
import 'package:done_app/widgets/scaled_text.dart';
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
  final double titleSize = 36;
  final double descriptionSize = 28;
  final double taskCountSize = 24;
  final double iconSize = 32;

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
              goalTitleAndDescription(),
            ],
          ),
          Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: widget.goal.goalColor.withOpacity(0.32),
                  borderRadius: AppRadius.all8
                ),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.add, size: iconSize).wrapFitted())
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: widget.goal.goalColor.withOpacity(0.32),
                  borderRadius: AppRadius.all8
                ),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.add, size: iconSize).wrapFitted())
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: widget.goal.goalColor.withOpacity(0.32),
                  borderRadius: AppRadius.all8
                ),
                child: IconButton(
                  onPressed: (){}, icon: Icon(Icons.add, size: iconSize).wrapFitted())
              )
            ],
          ).wrapPadding(AppPaddings.all8),
          Column(
            children: List.generate(widget.goal.tasks.length+5, (index) => taskCard()),
          )
        ],
      ),
    );
  }

  Widget taskCard() {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: widget.goal.goalColor),
        borderRadius: AppRadius.all16,
      ),
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: checkboxListTile(false)
    ).wrapPadding(AppPaddings.goalTaskCardPadding);
  }

  Widget checkboxListTile(bool checked) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text("title"),
      secondary: IconButton(
        onPressed: (){

        }, 
        icon: Icon(Icons.delete)
      ),
      value: checked, 
      onChanged: (value){

      }
    );
  }

  Widget arcProgress() {
    return CircularArc(
      textStyle: AppTextStyles.boldCustomSize(fontSize: percentSize),
      strokeWidth: arcStroke,
      size: context.dynamicWidth(0.64),
      progressPercent: widget.goal.goalCompletionPercentage,
      progressColor: widget.goal.goalColor,
    ).wrapAlign(Alignment.topCenter).wrapPadding(AppPaddings.all24);
  }

  Positioned goalTitleAndDescription() {
    return Positioned.fill(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          scaledText(widget.goal.goalTitle, titleSize, AppColors.black).wrapFitted(),
          scaledText(widget.goal.goalDescription, descriptionSize, AppColors.black54).wrapFitted(),
          scaledText('${widget.goal.tasks.length} items', taskCountSize, AppColors.black38)
        ],
      ).wrapAlign(Alignment.bottomLeft).wrapPadding(AppPaddings.horizontal16)
    );
  }

  ScaledText scaledText(String text, double fontSize, Color color) {
    return ScaledText(
      text: text, 
      style: AppTextStyles.boldCustomSize(fontSize: fontSize, color: color),
      textAlign: TextAlign.center
    );
  }
}
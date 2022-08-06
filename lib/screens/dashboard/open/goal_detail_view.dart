import 'package:auto_route/auto_route.dart';
import 'package:done_app/constants/app_colors.dart';
import 'package:done_app/providers/goal_provider.dart';
import 'package:done_app/screens/dashboard/open/add_task_dialog_view.dart';
import 'package:done_app/widgets/animated_dialog.dart';
import 'package:done_app/widgets/custom_snackbar.dart';
import 'package:done_app/widgets/goal_widgets/task_listview.dart';
import 'package:done_app/widgets/scaled_text.dart';
import 'package:flutter/material.dart';
import 'package:done_app/constants/app_styles.dart';
import 'package:done_app/extensions/context_extension.dart';
import 'package:done_app/extensions/widget_extension.dart';
import 'package:done_app/models/goal_model.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_strings.dart';
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
          progressInfo(),
          buttons(),
          TaskListView(goal: context.watch<GoalProvider>().getGoalList.firstWhere((e) => e == widget.goal,)),
        ],
      ),
    );
  }

  Stack progressInfo() {
    return Stack(
      children: [
        arcProgress(),
        goalTitleAndDescription(),
      ],
    );
  }

  Widget arcProgress() {
    return CircularArc(
      textStyle: AppTextStyles.boldCustomSize(fontSize: percentSize),
      strokeWidth: arcStroke,
      size: context.dynamicWidth(0.64),
      progressPercent: widget.goal.goalCompletionPercentage,
      progressColor: AppColors.goalColors[widget.goal.goalColorIndex],
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
      ).wrapAlign(Alignment.bottomLeft).wrapPadding(AppPaddings.horizontal8)
    );
  }

  ScaledText scaledText(String text, double fontSize, Color color) {
    return ScaledText(
      text: text, 
      style: AppTextStyles.boldCustomSize(fontSize: fontSize, color: color),
      textAlign: TextAlign.center
    );
  }

  Widget buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        iconButton(
          iconData: Icons.add, 
          onTap: (){
            AnimatedDialog.showDialog(
              context: context, 
              dialogPageContent: AddTaskDialogView(goal: widget.goal)
            );
          }
        ),
        Row(
          children: [
            iconButton(
              iconData: Icons.done_all, 
              onTap: (){
                
              }
            ),
            SizedBox(width: 8),
            iconButton(
              iconData: Icons.delete_forever, 
              onTap: () => CustomSnackBar.showSnackBarMessage(
                context: context, text: AppStrings.snackBarMessage,
                actionFunction: () async => context.router.popTop("delete")
              )
            ),
          ],
        ),
      ],
    ).wrapPadding(AppPaddings.all8);
  }

  DecoratedBox iconButton({required IconData iconData, required VoidCallback onTap}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.goalColors[widget.goal.goalColorIndex].withOpacity(0.32),
        borderRadius: AppRadius.tlbr12
      ),
      child: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: onTap, 
        icon: Icon(iconData, size: iconSize).wrapFitted()
      )
    );
  }

}
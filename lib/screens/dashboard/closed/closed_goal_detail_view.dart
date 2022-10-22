import 'package:auto_route/auto_route.dart';
import '../../../extensions/context_extension.dart';
import '../../../extensions/widget_extension.dart';
import '../../../models/goal_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../providers/goal_provider.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/goal_widgets/circular_arc_progress.dart';
import '../../../widgets/goal_widgets/task_reorderable_listview.dart';
import '../../../widgets/scaled_text.dart';

class ClosedGoalDetailView extends StatefulWidget {
  const ClosedGoalDetailView({Key? key, required this.goal}) : super(key: key);

  final Goal goal;

  @override
  State<ClosedGoalDetailView> createState() => _ClosedGoalDetailViewState();
}

class _ClosedGoalDetailViewState extends State<ClosedGoalDetailView> {

  final double arcStroke = 42;
  final double percentSize = 64;
  final double titleSize = 36;
  final double descriptionSize = 28;
  final double taskCountSize = 24;
  final double iconSize = 32;
  final double spaceWidth = 8;

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
          const Spacer(),
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
        Row(
          children: [
            iconButton(
              iconData: Icons.restart_alt, 
              onTap: () => CustomSnackBar.showSnackBarMessage(
                context: context, text: AppStrings.snackBarUndoGoal,
                actiontext: AppStrings.doIt,
                actionFunction: () async => context.router.popTop(AppStrings.doIt)
              )
            ),
            SizedBox(width: spaceWidth),
            iconButton(
              iconData: Icons.delete_forever, 
              onTap: () => CustomSnackBar.showSnackBarMessage(
                context: context, text: AppStrings.snackBarMessageDelete,
                actionFunction: () async => context.router.popTop(AppStrings.delete)
              )
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.done_all, size: context.dynamicWidth(0.1),),
            SizedBox(width: spaceWidth),
            scaledText(AppStrings.wellDONE, context.dynamicWidth(0.072), AppColors.black),
          ],
        )
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
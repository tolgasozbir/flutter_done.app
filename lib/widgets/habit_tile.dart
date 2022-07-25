import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/app_colors.dart';
import 'package:habit_tracker/constants/app_strings.dart';
import 'package:habit_tracker/constants/app_styles.dart';
import 'package:habit_tracker/extensions/context_extension.dart';
import 'package:habit_tracker/providers/habit_provider.dart';
import 'package:habit_tracker/screens/dialog_view.dart';
import 'package:habit_tracker/widgets/settings_dialog.dart';
import 'package:provider/provider.dart';
import '../models/habit_model.dart';
import 'circle_progress_indicator.dart';

class HabitTile extends StatefulWidget {
  HabitTile({
    Key? key, 
    required this.habit, 
    required this.index,
  }) : super(key: key);

  final Habit habit;
  final int index;

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: (){
        showDeleteMessage();
      },
      child: Container(
        padding: AppPaddings.habitTileContainerPadding,
        decoration: BoxDecoration(
          color: AppColors.tileBackground,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleProgressIndicator(index: widget.index),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.habit.habitTitle, style: AppTextStyles.generalTextStyle),
                    SizedBox(height: 4),
                    Text(
                      "${context.watch<HabitProvider>().formatElapsedTime(widget.habit.elapsedTime)} / ${context.watch<HabitProvider>().formatGoalTime(widget.habit.timeGoal)} - ${context.watch<HabitProvider>().calculatePercent(widget.index).toStringAsFixed(0)}%", 
                      style: AppTextStyles.subTextStyle
                    ),
                  ],
                ),
              ],
            ),
            settingsButton(context),
          ],
        ),
      ).wrapPadding(AppPaddings.habitTilePadding),
    );
  }

  IconButton settingsButton(BuildContext context) {
    return IconButton(
      onPressed: (){
        context.read<HabitProvider>().formatElapsedTime(widget.habit.elapsedTime);
        SettingsDialog.showSettingsDialog(
          context: context, 
          dialogPageContent: DialogView(habit: widget.habit,)
        );
      }, 
      icon: Icon(Icons.settings)
    );
  }

  void showDeleteMessage(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppStrings.snackBarMessage),
        action: SnackBarAction(
          label: AppStrings.snackBarDelete, 
          onPressed: (){
            context.read<HabitProvider>().deleteHabit(widget.habit);
          }
        )
      )
    );
  }
}


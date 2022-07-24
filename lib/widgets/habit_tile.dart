import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/app_colors.dart';
import 'package:habit_tracker/screens/dialog_view.dart';
import 'package:habit_tracker/widgets/settings_dialog.dart';
import 'package:provider/provider.dart';
import '../models/habit_model.dart';
import '../providers/habit_provider.dart';
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

  int hour = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        padding: EdgeInsets.all(20),
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
                    Text(widget.habit.habitTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(
                      "${context.watch<HabitProvider>().formatElapsedTime(widget.habit.elapsedTime)} / ${context.watch<HabitProvider>().formatGoalTime(widget.habit.timeGoal)} = ${context.watch<HabitProvider>().calculatePercent(widget.index).toStringAsFixed(0)}%", 
                    style: TextStyle(color: AppColors.subTextColor)),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: (){
                context.read<HabitProvider>().formatElapsedTime(widget.habit.elapsedTime);
                SettingsDialog.showSettingsDialog(
                  context: context, 
                  dialogPageContent: DialogView(habit: widget.habit,)
                );
              }, 
              icon: Icon(Icons.settings)
            ),
          ],
        ),
      ),
    );
  }
}


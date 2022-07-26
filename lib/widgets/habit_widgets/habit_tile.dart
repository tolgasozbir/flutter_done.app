import '../custom_snackbar.dart';
import '../scaled_text.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../constants/app_styles.dart';
import '../../extensions/widget_extension.dart';
import '../../providers/habit_provider.dart';
import '../../screens/dashboard/timer/timer_dialog_view.dart';
import '../animated_dialog.dart';
import 'package:provider/provider.dart';
import '../../models/habit_model.dart';
import 'circle_progress_indicator.dart';

class HabitTile extends StatelessWidget {
  const HabitTile({Key? key, required this.index, required this.habit}) : super(key: key);

  final int index;
  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () => CustomSnackBar.showSnackBarMessage(
        context: context, 
        text: AppStrings.snackBarMessageDelete,
        actionFunction: () async => context.read<HabitProvider>().deleteHabit(habit),
      ),
      child: Container(
        padding: AppPaddings.habitTileContainerPadding,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 0.5,
            )
          ],
          color: AppColors.tileBackground,
          borderRadius: AppRadius.all12
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleProgressIndicator(index: index),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScaledText(
                      text: habit.habitTitle,
                      style: AppTextStyles.generalTextStyle
                    ),
                    const SizedBox(height: 4),
                    ScaledText(
                      text: '${context.watch<HabitProvider>().formatElapsedTime(habit.elapsedTime)} / ${context.watch<HabitProvider>().formatGoalTime(habit.timeGoal)} - ${context.watch<HabitProvider>().calculatePercent(index).toStringAsFixed(0)}%',
                      style: const TextStyle(color: AppColors.subTextColor)
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
        context.read<HabitProvider>().formatElapsedTime(habit.elapsedTime);
        AnimatedDialog.showDialog(
          context: context, 
          dialogPageContent: DialogView(habit: habit,)
        );
      }, 
      icon: const Icon(Icons.settings)
    );
  }

}

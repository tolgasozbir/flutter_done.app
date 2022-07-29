import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../constants/app_styles.dart';
import '../extensions/widget_extension.dart';
import '../models/habit_model.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../extensions/context_extension.dart';
import '../providers/habit_provider.dart';
import '../widgets/list_wheel.dart';

class DialogView extends StatelessWidget {
  const DialogView({Key? key, required this.habit}) : super(key: key);

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.56),
      width: context.dynamicWidth(0.72),
      color: AppColors.appBarBackground,
      child: Column(
        children: [
          habitTitleTextField(),
          Text(
            AppStrings.dialogText, 
            style: AppTextStyles.generalTextStyle,
            textAlign: TextAlign.center,
          ).wrapPadding(AppPaddings.dialogTextPadding),
          listWheels(),
          saveButton(context)
        ],
      ).wrapPadding(AppPaddings.dialogContentPadding),
    );
  }


  Widget habitTitleTextField() {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      initialValue: habit.habitTitle,
      style: TextStyle(color: AppColors.white),
      decoration: AppDecorations.textFieldInputDecoration,
      onChanged: (String value){
        habit.habitTitle = value;
      },
    );
  }

  Expanded listWheels() {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          grayBackground(),
          Row(
            children: [
              Spacer(),
              expandedListWheel(listWheelType: ListWheelType.hour),
              expandedText(text: 'hrs'),
              expandedListWheel(listWheelType: ListWheelType.min),
              expandedText(text: 'mins'),
              Spacer()
            ],
          ),
        ],
      ), 
    );
  }

  Container grayBackground() {
    return Container(
    height: 28,
    width: double.infinity,
    margin: AppPaddings.marginSymmectric16,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.gray,
    ),
    );
  }

  Expanded expandedListWheel({required ListWheelType listWheelType}) {
    int hourValue = 0;
    int minsValue = 0;
    return Expanded(
      flex: 2, 
      child: ListWheel(
        listWheelType: listWheelType,
        goalTime: habit.timeGoal,
        selectedValue: (int value){
          listWheelType == ListWheelType.hour
            ? hourValue = value * 3600
            : minsValue = value * 60;
          if ((hourValue + minsValue) == 0) {
            minsValue = 60;
          }
          habit.timeGoal = hourValue + minsValue;
        },
      )
    );
  }

  Expanded expandedText({required String text}) {
    return Expanded(
      flex: 2, 
      child: Text(
        text,
        style:AppTextStyles.generalTextStyle,
        textAlign: TextAlign.center
      )
    );
  }

  Widget saveButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (){
          var provider = context.read<HabitProvider>();
          if (habit.habitTitle == "".trim()) {
            habit.habitTitle = AppStrings.habitEmptyTitle;
          }
          if (provider.getHabitList.any((e) => e.habitTitle == habit.habitTitle)) {
            var index = provider.getHabitList.indexWhere((e) => e.habitTitle == habit.habitTitle);
            provider.updateHabit(habit, index);
          } else {
            provider.addNewHabit(habit);
          }
          Navigator.pop(context);
        },
        child: Text(AppStrings.dialogSave)
      )
    );
  }
}
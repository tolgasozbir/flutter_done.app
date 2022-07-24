import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/app_strings.dart';
import 'package:habit_tracker/constants/app_styles.dart';
import 'package:habit_tracker/models/habit_model.dart';
import '../constants/app_colors.dart';
import '../extensions/context_extension.dart';
import '../widgets/list_wheel.dart';

class DialogView extends StatefulWidget {
  const DialogView({
    Key? key, 
    required this.habit
  }) : super(key: key);

  final Habit habit;

  @override
  State<DialogView> createState() => _DialogViewState();
}

class _DialogViewState extends State<DialogView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _bodyView();
  }

  Widget _bodyView() {
    return StatefulBuilder(
      builder: (context, setState) => Container(
        height: context.dynamicHeight(0.56),
        width: context.dynamicWidth(0.72),
        color: AppColors.appBarBackground,
        child: Column(
          children: [
            habitTitleTextField(),
            Text(AppStrings.dialogText, style: AppStyles.generalTextStyle ,textAlign: TextAlign.center).wrapPadding(AppPaddings.dialogTextPadding),
            listWheels(),
            saveButton()
          ],
        ).wrapPadding(AppPaddings.dialogContentPadding)
      ),
    );
  }

  Widget habitTitleTextField() {
    return TextFormField(
      initialValue: widget.habit.habitTitle,
      style: TextStyle(color: AppColors.white),
      decoration: AppDecorations.textFieldInputDecoration,
    );
  }

  Expanded listWheels() {
    return Expanded(
            child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade700,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                        height: 32,
                        width: double.infinity,
                      ),
                    Row(
                      children: [
                        Spacer(),
                        Expanded(flex: 2, child: ListWheel(listWheelType: ListWheelType.hour, time: widget.habit.timeGoal)),
                        Expanded(flex: 2, child: Text("hrs",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                        Expanded(flex: 2, child: ListWheel(listWheelType: ListWheelType.min, time: widget.habit.timeGoal)),
                        Expanded(flex: 2, child: Text("mins",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                        Spacer()
                      ],
                    ),
                  ],
                ), 
            );
  }

  Widget saveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (){}, 
        child: Text("Save")
      )
    );
  }

}
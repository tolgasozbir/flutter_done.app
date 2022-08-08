import 'package:done_app/constants/app_strings.dart';
import 'package:done_app/constants/app_styles.dart';
import 'package:done_app/extensions/context_extension.dart';
import 'package:done_app/extensions/widget_extension.dart';
import 'package:done_app/models/goal_model.dart';
import 'package:done_app/providers/goal_provider.dart';
import 'package:done_app/widgets/custom_snackbar.dart';
import 'package:done_app/widgets/scaled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_colors.dart';

class AddTaskDialogView extends StatelessWidget {
  AddTaskDialogView({Key? key, required this.goal}) : super(key: key);

  final Goal goal;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.all8,
      decoration: const BoxDecoration(
        borderRadius: AppRadius.tlbr32,
        color: AppColors.appBarBackground,
      ),
      //height: context.dynamicHeight(0.6),
      width: context.dynamicWidth(0.8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ScaledText(text: AppStrings.addNewTask).wrapPadding(AppPaddings.all8),
          textField(),
          saveButton(context)
        ],
      ),
    );
  }

  Widget textField() {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: AppColors.white),
      decoration: const InputDecoration(
        hintText: AppStrings.taskTitle,
        hintStyle: TextStyle(color: AppColors.white),
        contentPadding: AppPaddings.all8,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.white)),
        border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.white))
      ),
    ).wrapPadding(AppPaddings.all8);
  }

  Widget saveButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (){
          if (controller.text.isEmpty) {
            Navigator.pop(context);
            CustomSnackBar.showSnackBarMessage(context: context, text: AppStrings.emptyError);
            return;
          }
          context.read<GoalProvider>().addTask(controller.text, goal);
          Navigator.pop(context);
        }, 
        child: const Text(AppStrings.save)
      )
    ).wrapPadding(AppPaddings.all8);
  }

}
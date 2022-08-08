import 'package:done_app/extensions/context_extension.dart';
import 'package:done_app/extensions/widget_extension.dart';
import 'package:done_app/widgets/scaled_text.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';


class TitleWithTextField extends StatelessWidget {
  const TitleWithTextField({
    Key? key,
    required this.titleText,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  final String titleText;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {

    final InputDecoration inputDecoration = InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderRadius: AppRadius.all12,
        borderSide: BorderSide(color: AppColors.black, width: 1.5),
      ),
      hintStyle: TextStyle(fontSize: context.dynamicWidth(0.04)),
      hintText: hintText,
      border: const OutlineInputBorder(borderRadius: AppRadius.all12)
    );

    return SizedBox(
      height: context.dynamicHeight(0.14),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        ScaledText(
          text: titleText,
          style: AppTextStyles.createGoalTitleStyle,
        ),
        SizedBox(
          height: context.dynamicHeight(0.092),
          child: TextField(
            controller: controller,
            textCapitalization: TextCapitalization.words,
            decoration: inputDecoration,
          ).wrapPadding(AppPaddings.top8),
        ),
       ],
      ),
    );
  }
}

import '../../extensions/widget_extension.dart';
import '../scaled_text.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../constants/app_styles.dart';

class QuickTags extends StatelessWidget {
  const QuickTags({Key? key, required this.tagIndex}) : super(key: key);

  final void Function(int index) tagIndex;

  TextStyle textStyle(int index) => TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.goalColors[index%AppColors.goalColors.length]);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ScaledText(
          text: AppStrings.quickTag,
          style: AppTextStyles.createGoalTitleStyle,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(AppStrings.quickTagsTitles.length, (index) => quickTagChip(index,context)),
          ),
        ),
      ],
    );
  }

  Widget quickTagChip(int index, BuildContext context) {
    return GestureDetector(
      onTap: () => tagIndex.call(index),
      child: Chip(
        side: BorderSide(color: AppColors.goalColors[index%AppColors.goalColors.length]),
        label: ScaledText(
          text: '#${AppStrings.quickTagsTitles[index]}',
          style: textStyle(index),
        ),
        padding: AppPaddings.all8,
        backgroundColor: AppColors.white,
      ).wrapPadding(AppPaddings.right8),
    );
  }
}
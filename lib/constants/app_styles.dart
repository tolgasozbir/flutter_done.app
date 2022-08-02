import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_strings.dart';

class AppTextStyles {
  static const TextStyle subTextStyle = TextStyle(color: AppColors.subTextColor);
  static const TextStyle generalTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold,);
  static const TextStyle hintTextStyle = TextStyle(color: AppColors.white);
  static const TextStyle createGoalTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black73);

  static TextStyle createGoalChipStyle(int index) => TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.goalColors[index%AppColors.goalColors.length]);
  static TextStyle boldCustomSize(double fontSize) => TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold,);
}

class AppPaddings {
  static const EdgeInsets all4 = EdgeInsets.all(4);
  static const EdgeInsets all8 = EdgeInsets.all(8);
  static const EdgeInsets all16 = EdgeInsets.all(16);
  static const EdgeInsets all24 = EdgeInsets.all(24);
  static const EdgeInsets top8 = EdgeInsets.only(top: 8);
  static const EdgeInsets top16 = EdgeInsets.only(top: 16);
  static const EdgeInsets right8 = EdgeInsets.only(right: 8);
  static const EdgeInsets vertical8 = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets horizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets dialogTextPadding = EdgeInsets.fromLTRB(8, 32, 8, 0);
  static const EdgeInsets habitTilePadding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static const EdgeInsets habitTileContainerPadding = EdgeInsets.all(20);
  static const EdgeInsets habitInputDecorPadding = EdgeInsets.symmetric(horizontal: 12,vertical: 16);
  static const EdgeInsets arcGridPadding = EdgeInsets.symmetric(horizontal: 24,vertical: 16);
  static const EdgeInsets goalCardTextPadding = EdgeInsets.only(left: 8,bottom: 8);
  static const EdgeInsets goalDetailTextPadding = EdgeInsets.only(left: 16,bottom: 16, right: 16);
}

class AppRadius {
  static const BorderRadius all8 = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius all12 = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius all16 = BorderRadius.all(Radius.circular(16.0));
}

class AppDecorations {
  static const InputDecoration habitTextFieldInputDecor = InputDecoration(
    labelText: AppStrings.habitLabelText,
    labelStyle: AppTextStyles.hintTextStyle,
    hintStyle: AppTextStyles.hintTextStyle,
    hintText: AppStrings.habitHintText,
    contentPadding: AppPaddings.habitInputDecorPadding,
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.white)),
    border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.white))
  );

  static BoxDecoration goalProgressCardDecoration(Color color) => BoxDecoration(
    borderRadius: AppRadius.all16,
    border: Border.all(color: color, width: 2)
  );

  static InputDecoration goalCreateInputDecor(String hintText) => InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderRadius: AppRadius.all12,
      borderSide: BorderSide(color: AppColors.black, width: 1.5),
    ),
    hintText: hintText,
    border: OutlineInputBorder(borderRadius: AppRadius.all12)
  );
}

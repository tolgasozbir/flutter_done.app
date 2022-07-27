import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/app_colors.dart';
import 'package:habit_tracker/constants/app_strings.dart';

class AppTextStyles {
  static const TextStyle subTextStyle = TextStyle(color: AppColors.subTextColor);
  static const TextStyle generalTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold,);
  static const TextStyle hintTextStyle = TextStyle(color: AppColors.white);
}

class AppPaddings {
  static const EdgeInsets dialogTextPadding = EdgeInsets.fromLTRB(8, 32, 8, 0);
  static const EdgeInsets dialogContentPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 16);
  static const EdgeInsets habitTilePadding = EdgeInsets.only(left: 20, right: 20, top: 20);
  static const EdgeInsets habitTileContainerPadding = EdgeInsets.all(20);
  static const EdgeInsets marginSymmectric16 = EdgeInsets.symmetric(horizontal: 16);
}

class AppDecorations {
  static const InputDecoration textFieldInputDecoration = InputDecoration(
    labelText: AppStrings.labelText,
    labelStyle: AppTextStyles.hintTextStyle,
    hintStyle: AppTextStyles.hintTextStyle,
    hintText: AppStrings.hintText,
    contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.white)),
    border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.white))
  );
}
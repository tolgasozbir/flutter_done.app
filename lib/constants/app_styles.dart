import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_strings.dart';

class AppTextStyles {
  static const TextStyle subTextStyle = TextStyle(color: AppColors.subTextColor);
  static const TextStyle generalTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold,);
  static const TextStyle hintTextStyle = TextStyle(color: AppColors.white);
  static TextStyle boldCustomSize(double fontSize) => TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold,);
}

class AppPaddings {
  static const EdgeInsets all4 = EdgeInsets.all(4);
  static const EdgeInsets all8 = EdgeInsets.all(8);
  static const EdgeInsets top16 = EdgeInsets.only(top: 16);
  static const EdgeInsets dialogTextPadding = EdgeInsets.fromLTRB(8, 32, 8, 0);
  static const EdgeInsets dialogContentPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 16);  //TODO: horizonal vertical aynı olanları all yap
  static const EdgeInsets habitTilePadding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static const EdgeInsets habitTileContainerPadding = EdgeInsets.all(20);
  static const EdgeInsets marginSymmectric16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets arcGridPadding = EdgeInsets.symmetric(horizontal: 24,vertical: 16);
  static const EdgeInsets arcDetailPadding = EdgeInsets.symmetric(horizontal: 24,vertical: 24);
  static const EdgeInsets taskCardTextPadding = EdgeInsets.only(left: 8,bottom: 8);
  static const EdgeInsets taskDetailTextPadding = EdgeInsets.only(left: 16,bottom: 16, right: 16);
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

  static BoxDecoration TaskProgressCardDecoration(Color color) => BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: color, width: 2)
  );
}
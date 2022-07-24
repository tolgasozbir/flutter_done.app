import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/app_colors.dart';

class AppStyles {
  static const TextStyle subTextStyle = TextStyle(color: AppColors.subTextColor);
  static const TextStyle generalTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold,);
}

class AppPaddings {
  static const EdgeInsets dialogTextPadding = EdgeInsets.fromLTRB(8, 32, 8, 0);
  static const EdgeInsets dialogContentPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 16);
}

class AppDecorations {
  static const InputDecoration textFieldInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.white)),
    border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.white))
  );
}
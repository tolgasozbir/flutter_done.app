import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle generalTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold,);
  static const TextStyle hintTextStyle = TextStyle(color: AppColors.white);
  static const TextStyle createGoalTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black73);

  static TextStyle boldCustomSize({required double fontSize, Color? color}) => TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: color);
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
  static const EdgeInsets horizontal8 = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets horizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets dialogTextPadding = EdgeInsets.fromLTRB(8, 32, 8, 0);
  static const EdgeInsets habitTilePadding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static const EdgeInsets habitTileContainerPadding = EdgeInsets.all(20);
  static const EdgeInsets habitInputDecorPadding = EdgeInsets.symmetric(horizontal: 12,vertical: 16);
  static const EdgeInsets arcGridPadding = EdgeInsets.symmetric(horizontal: 24,vertical: 16);
  static const EdgeInsets goalCardTextPadding = EdgeInsets.only(left: 8,bottom: 8);
  static const EdgeInsets goalTaskCardPadding = EdgeInsets.symmetric(vertical: 4, horizontal: 8);
}

class AppRadius {
  static const BorderRadius all8 = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius all12 = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius all16 = BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius tlbr32 = BorderRadius.only(topLeft: Radius.circular(32), bottomRight: Radius.circular(32));
  static const BorderRadius tlbr12 = BorderRadius.only(topLeft: Radius.circular(12), bottomRight: Radius.circular(12));
}

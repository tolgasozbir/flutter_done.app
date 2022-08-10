import '../constants/app_colors.dart';
import '../extensions/widget_extension.dart';
import 'scaled_text.dart';
import 'package:flutter/material.dart';
import '../constants/app_strings.dart';

class CustomSnackBar {
  static showSnackBarMessage({required BuildContext context,required String text, VoidCallback? actionFunction , String actiontext = AppStrings.delete}){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: InkWell(
          onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          child: Container(
            height: 64,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.black73,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: ScaledText(text: text).wrapAlign(Alignment.centerLeft)),
                actionFunction != null
                  ? TextButton(
                      onPressed: (){
                        actionFunction();
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      }, 
                      child: ScaledText(text: actiontext)
                    )
                  : const SizedBox.shrink()
              ],
            ),
          ),
        )
      )
    );
  }
}
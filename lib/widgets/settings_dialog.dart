import 'package:flutter/material.dart';

class SettingsDialog {
  static void showSettingsDialog({
    required BuildContext context,
    required Widget dialogPageContent,
    Duration duration = const Duration(milliseconds: 600),
    bool barrierDismissible = true,
    Color barrierColor = const Color(0x80000000),
  }) {
    showGeneralDialog(
      context: context,
      transitionDuration: duration,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: '',
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) { 
        return Material(
          textStyle: TextStyle(color: Colors.white),
          type: MaterialType.transparency, 
          child: Align(
            alignment: Alignment.center, 
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 200, 
                maxWidth: MediaQuery.of(context).size.width*0.9,
                minHeight: 100,
                maxHeight: MediaQuery.of(context).size.height*0.9
              ),
              child: dialogPageContent
            )
          )
        ); 
      },
      transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,Widget child) {
        return Transform.scale(
          scaleX: 1,
          scaleY: animation.value,
          child: Opacity(
            opacity: animation.value,
            child: child
          ),
        );
      },
    );
  }
}
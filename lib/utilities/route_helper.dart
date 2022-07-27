import 'package:flutter/material.dart';

class RouteHelper {
  static void goRoute({required BuildContext context,required Widget page}){
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }  
  
  static void goRouteAndRemoveUntilAnimated({required BuildContext context,required Widget page}){

    Navigator.pushAndRemoveUntil(
      context, 
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionDuration: const Duration(milliseconds: 1600),
        transitionsBuilder: (_, anim, __, child) => FadeTransition(opacity: anim,child: child,)
      ),
      (route) => false
    );
  }

  // static void goRouteReplacement({required BuildContext context,required Widget page}){
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
  // }
}
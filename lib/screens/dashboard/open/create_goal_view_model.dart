import 'dart:math';

import 'package:done_app/constants/task_icons.dart';
import 'package:flutter/material.dart';
import 'create_goal_view.dart';

abstract class CreateGoalViewModel extends State<CreateGoalView> with SingleTickerProviderStateMixin {
  late AnimationController rippleController;
  int selectedColorIndex = 0;
  int selectedIconIndex = 0;

  @override
  void initState() {
    super.initState();
    randomIconIndex();
    rippleController = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: 1000),
    );
    rippleController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    rippleController.dispose();
  }

  void randomIconIndex(){
    selectedIconIndex = Random().nextInt(TaskIcons.taskIconList.length);
  }

}

class WaveClipper extends CustomClipper<Path> {
  final double value;

  WaveClipper({required this.value});
  @override
  Path getClip(Size size) {
    var path = Path();
    path.addOval(Rect.fromCircle(center: Offset(size.width/2,size.height-60), radius: value*size.height));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
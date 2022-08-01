import 'package:flutter/material.dart';
import 'create_goal_view.dart';

abstract class CreateGoalViewModel extends State<CreateGoalView> with SingleTickerProviderStateMixin {

  late AnimationController rippleController;

  @override
  void initState() {
    super.initState();
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
import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:done_app/constants/app_strings.dart';
import 'package:done_app/constants/goal_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_colors.dart';
import '../../../models/goal_model.dart';
import '../../../providers/goal_provider.dart';
import 'create_goal_view.dart';

abstract class CreateGoalViewModel extends State<CreateGoalView> with SingleTickerProviderStateMixin {
  late AnimationController rippleController;
  final goalTitleController = TextEditingController();
  final goalDescController = TextEditingController();
  int selectedColorIndex = 0;
  int selectedIconIndex = 0;
  final double selectIconSize = 32;

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

  void setQuickTag(int index){
    setState(() {
      goalTitleController.text = AppStrings.quickTagsTitles[index];
      selectedColorIndex = index%AppColors.goalColors.length;
    });
  }

  void randomIconIndex(){
    selectedIconIndex = Random().nextInt(GoalIcons.goalIconList.length);
  }

  void addGoal(){
    var provider = context.read<GoalProvider>();
    Goal goal = Goal(
      id: provider.getGoalList.length+1,
      goalTitle: goalTitleController.text, 
      goalDescription: goalDescController.text,
      goalIconData: GoalIcons.goalIconList[selectedIconIndex], 
      goalColor: AppColors.goalColors[selectedColorIndex],
    );
    if (goalTitleController.text.isEmpty) {
      goal.goalTitle = "Unnamed";
    }
    if (goalDescController.text.isEmpty) {
      goal.goalDescription = " ";
    }
    provider.addNewGoal(goal);
    animateAndPop();
  }

  animateAndPop(){
    rippleController.reverse().then((value) => context.router.popTop());
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
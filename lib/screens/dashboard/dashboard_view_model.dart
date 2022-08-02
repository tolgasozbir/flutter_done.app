import 'dart:async';
import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:done_app/widgets/animated_dialog.dart';
import 'package:flutter/material.dart';
import '../../constants/app_strings.dart';
import '../../models/habit_model.dart';
import 'dashboard_view.dart';
import 'open/create_goal_view.dart';
import 'timer/timer_dialog_view.dart';

abstract class DashboardViewModel extends State<DashboardView> {

  int currentTitleIndex = 0;
  final Duration titleDuration = const Duration(seconds: 30);
  final Random rnd = Random();

  @override
  void initState() {
    super.initState();
    timerTitleChanger();
  }

  void timerTitleChanger(){
    currentTitleIndex = rnd.nextInt(AppStrings.quotations.length);
    Timer.periodic(titleDuration, (timer){
      setState(() => currentTitleIndex = rnd.nextInt(AppStrings.quotations.length));
    });
  }

  void fabBtnFunction(){
    String currentPath = context.router.urlState.flatten.path;
    if (currentPath == 'timer') createNewHabit();
    else if (currentPath == 'goals') goToCreateGoalPage();
  }

  void createNewHabit(){
    Habit habit = Habit(habitTitle: "", elapsedTime: 0, timeGoal: 300);
    AnimatedDialog.showSettingsDialog(context: context, dialogPageContent: DialogView(habit: habit));
  }

  void goToCreateGoalPage(){
    context.router.pushNativeRoute(PageRouteBuilder(opaque: false, pageBuilder: (context, animation, secondaryAnimation) => CreateGoalView()));
  }
  
}
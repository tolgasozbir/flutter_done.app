import 'dart:async';
import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:done_app/providers/goal_provider.dart';
import 'package:done_app/widgets/animated_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_strings.dart';
import '../../models/goal_model.dart';
import '../../models/habit_model.dart';
import 'dashboard_view.dart';
import 'goals/add_task_dialog_view.dart';
import 'goals/create_goal_view.dart';
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
    //print(currentPath);
    if (currentPath == 'timer') createNewHabit();
    else if (currentPath == 'goals') goToCreateGoalPage();
    else if (currentPath == 'goalDetail') addNewTask();
  }

  void createNewHabit(){
    Habit habit = Habit(habitTitle: "", elapsedTime: 0, timeGoal: 300);
    AnimatedDialog.showDialog(context: context, dialogPageContent: DialogView(habit: habit));
  }

  void goToCreateGoalPage(){
    context.router.pushNativeRoute(PageRouteBuilder(opaque: false, pageBuilder: (context, animation, secondaryAnimation) => CreateGoalView()));
  }
  
  void addNewTask(){
    Goal? goal = context.read<GoalProvider>().lastClickedGoal;
    if (goal != null) {
      AnimatedDialog.showDialog(context: context, dialogPageContent: AddTaskDialogView(goal: goal));
    }
  }
  
}
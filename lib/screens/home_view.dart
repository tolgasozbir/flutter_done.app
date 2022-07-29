import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../models/habit_model.dart';
import 'dialog_view.dart';
import 'goals_view.dart';
import 'timer_view.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/settings_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int currentNavIndex = 0;
  int currentTitleIndex = 0;

  List<Widget> navPages = [
    GoalsView(),
    Text("page 2"),
    TimerView(),
    Text("page 4"),
  ];

  @override
  void initState() {
    super.initState();
    timerTitleChanger();
  }

  void timerTitleChanger(){
    final Random rnd = Random();
    currentTitleIndex = rnd.nextInt(AppStrings.quotations.length);
    Timer.periodic(Duration(seconds: 30), (timer){
      setState(() => currentTitleIndex = rnd.nextInt(AppStrings.quotations.length));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: addHabitButton(),
      body: navPages[currentNavIndex],
      bottomNavigationBar: BottomNavBar(
        selectedTap: (tapIndex) => setState(() => currentNavIndex = tapIndex),
        selectedIndex: currentNavIndex,
      )
    );
  }

  FittedBox appBarTitle() => FittedBox(child: Text(AppStrings.quotations[currentTitleIndex]));

  FloatingActionButton addHabitButton() {
    return FloatingActionButton(
      onPressed: (){
        Habit habit = Habit(habitTitle: "", elapsedTime: 0, timeGoal: 300);
        SettingsDialog.showSettingsDialog(context: context, dialogPageContent: DialogView(habit: habit));
      },
      child: Icon(Icons.add),
    );
  }

}
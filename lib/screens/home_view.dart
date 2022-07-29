import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/app_strings.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:habit_tracker/screens/dialog_view.dart';
import 'package:habit_tracker/screens/timer_view.dart';
import 'package:habit_tracker/widgets/bottom_navbar.dart';
import 'package:habit_tracker/widgets/settings_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int currentNavIndex = 0;
  int currentTitleIndex = 0;

  List<Widget> navPages = [
    Text("page 1"),
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
      bottomNavigationBar: BottomNavbar(
        selectedTap: (tapIndex) => setState(() => currentNavIndex = tapIndex),
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
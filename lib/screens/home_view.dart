import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/app_strings.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:habit_tracker/screens/dialog_view.dart';
import 'package:habit_tracker/widgets/settings_dialog.dart';
import '../widgets/habit_tile.dart';
import '../providers/habit_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int currentTitleIndex = 0;

  @override
  void initState() {
    super.initState();
    timerTitleChanger();
  }

  void timerTitleChanger(){
    final Random rnd = Random();
    currentTitleIndex = rnd.nextInt(AppStrings.quotations.length);
    Timer.periodic(Duration(seconds: 20), (timer){
      setState(() => currentTitleIndex = rnd.nextInt(AppStrings.quotations.length));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(),
      ),
      floatingActionButton: addHabitButton(),
      body: _bodyView(),
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

  Widget _bodyView() {
    List<Habit> habitList = context.watch<HabitProvider>().getHabitList;
    return ListView.builder(
      itemCount: habitList.length,
      itemBuilder: (BuildContext context, int index) {
        Habit habit = habitList[index];
        return HabitTile(habit: habit, index: index);
      },
    );
  }
}
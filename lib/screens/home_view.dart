import 'package:flutter/material.dart';
import 'package:habit_tracker/habit_tile.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:habit_tracker/providers/habit_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: addHabitButton(),
      body: _bodyView(),
    );
  }

  FloatingActionButton addHabitButton() {
    return FloatingActionButton(
      onPressed: (){
        context.read<HabitProvider>().addNewHabit(
          Habit(habitTitle: "test", elapsedTime: 0, timeGoal: 10));
      },
      child: Icon(Icons.add),
    );
  }

  Widget _bodyView() {
    return ListView.builder(
      itemCount: context.watch<HabitProvider>().getHabitList.length,
      itemBuilder: (BuildContext context, int index) {
        return HabitTile(habit: context.watch<HabitProvider>().getHabitList[index], index: index);
      },
    );
  }
}
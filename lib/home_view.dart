import 'package:flutter/material.dart';
import 'package:habit_tracker/habit_tile.dart';
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
      body: _bodyView(),
    );
  }

  Widget _bodyView() {
    return Column(
      children: [
        HabitTile(habit: context.watch<HabitProvider>().getHabitList[0],index: 0),
        HabitTile(habit: context.watch<HabitProvider>().getHabitList[1],index: 1,),
      ],
    );
  }
}
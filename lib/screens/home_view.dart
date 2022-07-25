import 'package:flutter/material.dart';
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
        Habit habit = Habit(habitTitle: "", elapsedTime: 3900, timeGoal: 300);
        SettingsDialog.showSettingsDialog(context: context, dialogPageContent: DialogView(habit: habit));
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
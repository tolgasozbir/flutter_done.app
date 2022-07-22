import 'package:flutter/material.dart';
import 'package:habit_tracker/circle_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'models/habit_model.dart';
import 'providers/habit_provider.dart';

class HabitTile extends StatefulWidget {
  HabitTile({
    Key? key, 
    required this.habit, 
    required this.index,
  }) : super(key: key);

  final Habit habit;
  final int index;

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleProgressIndicator(index: widget.index),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.habit.habitTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("${widget.habit.elapsedTime} / ${widget.habit.timeGoal} = ${context.watch<HabitProvider>().calculatePercent(widget.index).toStringAsFixed(0)}%", 
                    style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
              ],
            ),
            Icon(Icons.settings)
          ],
        ),
      ),
    );
  }
}
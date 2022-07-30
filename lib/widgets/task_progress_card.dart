import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habit_tracker/extensions/widget_extension.dart';

import 'circular_arc_progress.dart';

class TaskProgressCard extends StatelessWidget {
  const TaskProgressCard({
    Key? key, 
    required this.completionPercentage, 
    required this.taskTitle, 
    required this.taskCount, 
    required this.taskIconData, 
    required this.borderColor,
  }) : super(key: key);

  final double completionPercentage;
  final String taskTitle;
  final String taskCount;
  final IconData taskIconData;
  final Color borderColor;
  //TODO MODEL OLCAK

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 2)
      ),
      child: Stack(
        children: [
          CircularArc(
            progressPercent: completionPercentage,
            strokeWidth: 18, 
            progressColor: borderColor,
          ).wrapPadding(EdgeInsets.symmetric(horizontal: 24,vertical: 16)),
          Icon(taskIconData,size: 32).wrapPadding(EdgeInsets.all(4)),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text("$taskTitle", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ,textAlign: TextAlign.center,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("$taskCount Tasks")
                  )
                ],
              )
            ).wrapPadding(EdgeInsets.only(left: 8,bottom: 8))
          ),
        ],
      )
    );
  }
}
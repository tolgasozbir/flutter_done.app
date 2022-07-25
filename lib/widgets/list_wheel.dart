import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/app_styles.dart';
import 'package:habit_tracker/providers/habit_provider.dart';
import 'package:provider/provider.dart';

enum ListWheelType {
  min,hour
}

class ListWheel extends StatefulWidget {
  const ListWheel({
    Key? key, 
    this.goalTime = 0, required this.listWheelType, 
    required this.selectedValue,
  }) : super(key: key);

  final ListWheelType listWheelType;
  final int goalTime;
  final void Function(int value) selectedValue;

  @override
  State<ListWheel> createState() => _ListWheelState();
}

class _ListWheelState extends State<ListWheel> {
  final double _itemExtent = 16;
  final Duration duration = const Duration(milliseconds: 600);
  double mins = 0;
  double hours = 0;

  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void init() async {
    formatTime();
    scrollController = ScrollController();
    scrollController.addListener(() {  
      widget.selectedValue((scrollController.position.pixels / _itemExtent).round());
    });
    await Future.delayed(duration,(){
      if (scrollController.hasClients) {
        scrollController.animateTo(
          widget.listWheelType == ListWheelType.hour 
            ? (hours * _itemExtent) 
            : (mins * _itemExtent), 
        duration: duration, 
        curve: Curves.linear); 
      }
    });
  }

  void formatTime(){
    String time = context.read<HabitProvider>().formatGoalTime(widget.goalTime);
    if (time.endsWith(' Hours')) {
      time = time.substring(0, time.length -6);
      if (time.length>=3) {
        hours = double.tryParse(time.split(':')[0]) ?? 0;
      }
      mins =  double.tryParse(time.split(':')[1]) ?? 0;
    } else {
      time = time.substring(0,time.length-5);
      mins = double.tryParse(time) ?? 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      controller: scrollController,
      perspective: .005,
      diameterRatio: 1,
      itemExtent: _itemExtent, 
      children: List.generate(
        widget.listWheelType == ListWheelType.hour 
          ? 24
          : 60 
        ,(index) => Text("$index",style: AppTextStyles.generalTextStyle, textAlign: TextAlign.center)
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:habit_tracker/providers/habit_provider.dart';
import 'package:provider/provider.dart';

enum ListWheelType {
  min,hour
}

class ListWheel extends StatefulWidget {
  const ListWheel({
    Key? key, 
    this.value = 5, required this.listWheelType,
  }) : super(key: key);

  final ListWheelType listWheelType;
  final int value;

  @override
  State<ListWheel> createState() => _ListWheelState();
}

class _ListWheelState extends State<ListWheel> {
  final double _itemExtent = 16;

  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    scrollController = ScrollController();
    await Future.delayed(Duration(milliseconds: 600),(){
      double mins = 0;
      double hours = 0;
      String time = context.read<HabitProvider>().formatGoalTime(widget.value);
      if (time.endsWith(' Hours')) {
        time = time.substring(0, time.length -6);
        if (time.length>=3) {
          hours = double.tryParse(time.split(':')[0]) ?? 0;
        }
        mins =  double.tryParse(time.split(':')[1]) ?? 0;
      } else if (time.endsWith(' Mins')) {
        time = time.substring(0,time.length-5);
        mins = double.tryParse(time) ?? 0;
      }

      if (scrollController.hasClients) {
        scrollController.animateTo(
          widget.listWheelType == ListWheelType.hour 
            ? (hours * _itemExtent) 
            : (mins * _itemExtent), 
        duration: Duration(milliseconds: 600), 
        curve: Curves.linear); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      controller: scrollController,
      // ScrollController(
      //   initialScrollOffset: widget.listWheelType == ListWheelType.hour 
      //     ? (hours * _itemExtent) 
      //     : (mins * _itemExtent)
      // ),
      onSelectedItemChanged: (value) {

      },
      perspective: .005,
      diameterRatio: 1,
      itemExtent: _itemExtent, 
      children: List.generate(
        widget.listWheelType == ListWheelType.hour 
          ? 24
          : 60 
        ,(index) => Text("$index",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),textAlign: TextAlign.center,))
    );
  }
}
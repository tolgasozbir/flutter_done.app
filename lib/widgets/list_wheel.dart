import 'package:flutter/material.dart';

class ListWheel extends StatelessWidget {
  const ListWheel({
    Key? key, 
    required this.itemCount, 
    this.value = 0,
  }) : super(key: key);

  final int itemCount;
  final double value;
  final double _itemExtent = 16;

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      controller: ScrollController(initialScrollOffset: value*_itemExtent),
      onSelectedItemChanged: (value) {

      },
      perspective: .005,
      diameterRatio: 1,
      itemExtent: _itemExtent, 
      children: List.generate(itemCount, (index) => Text("$index",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),textAlign: TextAlign.center,))
    );
  }
}
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.selectedTap, required this.selectedIndex}) : super(key: key);

  final void Function(int) selectedTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 8,
      shape: CircularNotchedRectangle(),
      child: SizedBox(
        height: 60,
        child: navBarItems(),
      ),
    );
  }

  Row navBarItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //left side
        Row(
          children: [
            navBarItem(tapIndex: 0, iconData: Icons.widgets_outlined, text: 'Open'),
            navBarItem(tapIndex: 1, iconData: Icons.task_alt_outlined, text: 'Closed'),
          ],
        ),
        //right side
        Row(
          children: [
            navBarItem(tapIndex: 2, iconData: Icons.timelapse_outlined, text: 'Timer'),
            navBarItem(tapIndex: 3, iconData: Icons.query_stats_outlined, text: 'Stats'),
          ],
        ),
      ],
    );
  }

  MaterialButton navBarItem({required int tapIndex, required IconData iconData, required String text}) {
    return MaterialButton(
      onPressed: (){
        selectedTap.call(tapIndex);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, color: selectedIndex == tapIndex ? Colors.amber : Colors.red,),
          Text("$text")
        ],
      ),
    );
  }
}
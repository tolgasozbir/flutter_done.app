import 'package:auto_route/auto_route.dart';
import 'package:done_app/extensions/widget_extension.dart';
import 'package:done_app/widgets/scaled_text.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.selectedTap, required this.selectedIndex}) : super(key: key);

  final void Function(int) selectedTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: navBarItems(context),
      ),
    );
  }

  Widget navBarItems(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //left side
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: navBarItem(context: context, tapIndex: 0, iconData: Icons.widgets_outlined, text: 'Goals')),
                Expanded(child: navBarItem(context: context, tapIndex: 1, iconData: Icons.task_alt_outlined, text: 'Closed')),
              ],
            ),
          ),
          const Spacer(),
          //right side
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: navBarItem(context: context, tapIndex: 2, iconData: Icons.timelapse_outlined, text: 'Timer')),
                Expanded(child: navBarItem(context: context, tapIndex: 3, iconData: Icons.query_stats_outlined, text: 'Stats')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MaterialButton navBarItem({required BuildContext context, required int tapIndex, required IconData iconData, required String text}) {
    return MaterialButton(
      //minWidth: context.dynamicWidth(0.1),
      onPressed: (){
        selectedTap.call(tapIndex);
        context.router.popTop();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, color: selectedIndex == tapIndex ? Colors.amber : Colors.red,),
          ScaledText(text: text).wrapFitted(),
        ],
      ),
    );
  }
}
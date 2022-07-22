import 'package:flutter/material.dart';
import 'package:habit_tracker/providers/habit_provider.dart';
import 'package:provider/provider.dart';

class CircleProgressIndicator extends StatefulWidget {
  CircleProgressIndicator({
    Key? key, 
    required this.index, 
  }) : super(key: key);

  final int index;

  @override
  State<CircleProgressIndicator> createState() => _CircleProgressIndicatorState();
}

class _CircleProgressIndicatorState extends State<CircleProgressIndicator> with TickerProviderStateMixin {

  double size = 50;

  late AnimationController _animatedIconController;

  void changeStatus(BuildContext context){
    int index = widget.index;
    var habitProvider = context.read<HabitProvider>();
    habitProvider.changeHabitStatus(index);
    bool habitStatus = habitProvider.getHabitStatus(index);
    habitStatus ? _animatedIconController.forward() : _animatedIconController.reverse();
    habitProvider.startTimer(index);
    print("is started $habitStatus current value ${habitProvider.getElapsedTime(index)}");
  }

  @override
  void initState() {
    super.initState();
    _animatedIconController = AnimationController(vsync: this,duration: Duration(milliseconds: 400));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        changeStatus(context);
      },
      child: Container(
        height: size,
        width: size,
        child: Stack(
          children: [
            SizedBox(
              height: size,
              width: size,
              child: indicator(),
            ),
            animatedIcon()
          ],
        ),
      ),
    );
  }

  CircularProgressIndicator indicator() {
    return CircularProgressIndicator(
      backgroundColor: Colors.amber,
      color: Colors.red,
      value: 0.5,
      strokeWidth: 5,
    );
  }

  Widget animatedIcon() {
    return Center(
      child: AnimatedIcon(
        icon: AnimatedIcons.play_pause, 
        progress: _animatedIconController
      )
    );
  }
}
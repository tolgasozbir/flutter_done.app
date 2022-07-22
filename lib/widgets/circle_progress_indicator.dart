import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';

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

  Widget indicator() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(seconds: 1),
      tween: Tween(begin: context.watch<HabitProvider>().getElapsedTime(widget.index).toDouble(), end: context.watch<HabitProvider>().calculatePercent(widget.index)/100),
      builder: (BuildContext context,double value, Widget? child) {
        return CircularProgressIndicator(
        backgroundColor: Colors.grey,
        color: value >= 0.5 && value < 0.8
          ? Colors.orange
          : value > 0.8 
            ? Colors.green
            : Colors.red,
        value: value,
        strokeWidth: 5,
        );
      },
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
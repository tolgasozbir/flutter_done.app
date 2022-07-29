import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
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

class _CircleProgressIndicatorState extends State<CircleProgressIndicator> with SingleTickerProviderStateMixin {

  final double size = 50;
  late AnimationController _animatedIconController;

  void changeStatus(BuildContext context){
    int index = widget.index;
    var habitProvider = context.read<HabitProvider>();

    habitProvider.changeStatus(index);
    habitProvider.getStatus(index) 
      ? _animatedIconController.forward() 
      : _animatedIconController.reverse();;
  }

  @override
  void initState() {
    super.initState();
    _animatedIconController = AnimationController(vsync: this,duration: Duration(milliseconds: 400));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var habitProvider = Provider.of<HabitProvider>(context, listen: false);
      var isStarted = habitProvider.getStatus(widget.index);
      if (isStarted) {
        _animatedIconController.forward();
      }else{
        _animatedIconController.reverse();
      }
    });
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
      tween: Tween(
        begin: 0,//context.watch<HabitProvider>().getElapsedTime(widget.index).toDouble(), 
        end: context.watch<HabitProvider>().calculatePercent(widget.index)/100,
      ),
      builder: (BuildContext context,double value, Widget? child) {
        return CircularProgressIndicator(
        backgroundColor: Colors.grey,
        color: value >= 0.5 && value < 0.8
          ? AppColors.progresOrangeColor
          : value >= 0.8 
            ? AppColors.progresGreenColor
            : AppColors.progresRedColor,
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
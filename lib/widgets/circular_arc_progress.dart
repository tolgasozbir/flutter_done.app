import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:habit_tracker/extensions/widget_extension.dart';

class CircularArc extends StatefulWidget {
  CircularArc({
    Key? key, 
    this.size = 200, 
    this.strokeWidth = 24, 
    required this.progressPercent, 
    required this.progressColor, 
    this.textStyle = const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
  }) : super(key: key);

  final double progressPercent;
  final double size;
  final double strokeWidth;
  final Color progressColor;
  final TextStyle textStyle;

  @override
  State<CircularArc> createState() => _CircularArcState();
}

class _CircularArcState extends State<CircularArc> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1600));
    final curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCubic);
    _animation = Tween<double>(begin: 0.0, end: ((widget.progressPercent/100*math.pi))).animate(curvedAnimation)..addListener(() {
      setState(() {});
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double size = widget.size;
    return Stack(
      children: [
        CustomPaint(
          size: Size(size, size),
          painter: ProgresArcPainter(
            strokeWidth: widget.strokeWidth,
            progressColor: Colors.black54
          ),
        ).wrapPadding(EdgeInsets.only(top: 16)),
        CustomPaint(
          size: Size(size, size),
          painter: ProgresArcPainter(
            strokeWidth: widget.strokeWidth,
            arc: _animation.value,
            progressColor: widget.progressColor
          ),
        ).wrapPadding(EdgeInsets.only(top: 16)),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text("${(_animation.value / math.pi * 100).round()}%", style: widget.textStyle))
        )
      ],
    );
  }

}

    /// DRAW ARC ///

class ProgresArcPainter extends CustomPainter {

  final double strokeWidth;
  final double arc;
  final Color progressColor;

  ProgresArcPainter({
    this.arc = math.pi,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final startAngle = math.pi-0.1;
    final sweepAngle = arc+0.2;
    final useCenter = false;
    final paint = Paint()
    ..strokeCap = StrokeCap.round
    ..color = progressColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(ProgresArcPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ProgresArcPainter oldDelegate) => false;
}

import 'dart:math' as math;
import 'package:done_app/widgets/scaled_text.dart';
import 'package:flutter/material.dart';
import 'package:done_app/constants/app_colors.dart';
import 'package:done_app/constants/app_styles.dart';
import 'package:done_app/extensions/widget_extension.dart';

class CircularArc extends StatefulWidget {
  const CircularArc({
    Key? key, 
    this.size = 200, 
    this.strokeWidth = 24, 
    this.isGraident = false,
    required this.progressPercent, 
    required this.progressColor, 
    this.textStyle = const TextStyle(fontSize: 36, fontWeight: FontWeight.bold), 
  }) : super(key: key);

  final double progressPercent;
  final double size;
  final double strokeWidth;
  final Color progressColor;
  final TextStyle textStyle;
  final bool isGraident;

  @override
  State<CircularArc> createState() => _CircularArcState();
}

class _CircularArcState extends State<CircularArc> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  void didUpdateWidget(covariant CircularArc oldWidget) {
    if (oldWidget.progressPercent != widget.progressPercent) {
      updateAnimation(oldWidget);
    }
    super.didUpdateWidget(oldWidget);
  }

  void initAnimation(){
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1600));
    final curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCubic);
    double begin = 0.0;
    double end = widget.progressPercent/100*math.pi;
    _animation = Tween<double>(begin: begin, end: end).animate(curvedAnimation)..addListener(() {
      setState(() {});
    });
    _animationController.forward();
  }

  void updateAnimation(covariant CircularArc oldWidget){
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1600));
    final curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCubic);
    double begin = oldWidget.progressPercent/100*math.pi;
    double end = widget.progressPercent/100*math.pi;
    _animation = Tween<double>(begin: begin, end: end).animate(curvedAnimation)..addListener(() {
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
            isGraident: false,
            strokeWidth: widget.strokeWidth,
            progressColor: AppColors.black54
          ),
        ).wrapPadding(AppPaddings.top16),
        CustomPaint(
          size: Size(size, size),
          painter: ProgresArcPainter(
            isGraident: widget.isGraident,
            strokeWidth: widget.strokeWidth,
            arc: _animation.value,
            progressColor: widget.progressColor
          ),
        ).wrapPadding(AppPaddings.top16),
        Positioned.fill(
          child: ScaledText(
            text: '${(_animation.value / math.pi * 100).round()}%',
            style: widget.textStyle
          ).wrapAlign(Alignment.center)
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
  final bool isGraident;

  ProgresArcPainter({
    this.arc = math.pi,
    required this.progressColor,
    required this.strokeWidth,
    required this.isGraident
  });

  final Gradient gradient = const LinearGradient(
    colors: [
      AppColors.progresRedColor,
      AppColors.progresOrangeColor,
      AppColors.progresGreenColor,
    ]
  );

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    const startAngle = math.pi-0.1;
    final sweepAngle = arc+0.2;
    const useCenter = false;
    final paint = Paint()
    ..strokeCap = StrokeCap.round
    ..color = progressColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth;

    if (isGraident) {
      paint.shader = gradient.createShader(rect);
    }

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(ProgresArcPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ProgresArcPainter oldDelegate) => false;
}

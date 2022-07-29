import 'package:flutter/material.dart';

class CircularArc extends StatefulWidget {
  CircularArc({
    Key? key, 
    this.size = 200, 
    this.strokeWidth = 24,
  }) : super(key: key);

  final double size;
  final double strokeWidth;

  @override
  State<CircularArc> createState() => _CircularArcState();
}

class _CircularArcState extends State<CircularArc> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1600));
    final curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCubic);
    _animation = Tween<double>(begin: 0.0, end: 3.1415).animate(curvedAnimation)..addListener(() {
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
  Widget build(BuildContext context) {
    double size = widget.size;
    return ClipPath(
      clipper: ArcClipper(),
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: ProgresArcPainter(
              strokeWidth: widget.strokeWidth,
              progressColor: Colors.black54
            ),
          ),
          CustomPaint(
            size: Size(size, size),
            painter: ProgresArcPainter(
              strokeWidth: widget.strokeWidth,
              arc: _animation.value,
              progressColor: Colors.amber
            ),
          ),
          // Positioned(
          //   top: 120,
          //   left: 130,
          //   child: Text("${(_animation.value / math.pi * 100).round()}%", style: TextStyle(fontSize: 30))
          // )
        ],
      ),
    );
  }
}

    /// DRAW ARC ///

class ProgresArcPainter extends CustomPainter {

  final strokeWidth;
  final double arc;
  final Color progressColor;

  ProgresArcPainter({
    this.arc = 3.1415,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    //final rect = Rect.fromCenter(center: Offset(size.width/2, size.height/2), width: size.width, height: size.height);
    //final rect = Rect.fromCircle(center: Offset(size.width/2, size.height/2), radius: (math.min(size.width, size.height)/2));

    final startAngle = 3.1415;
    final sweepAngle = arc;
    final useCenter = false;
    final paint = Paint()
    ..strokeCap = StrokeCap.round
    ..color = progressColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(ProgresArcPainter oldDelegate) => true; //çizimler static ise false

  @override
  bool shouldRebuildSemantics(ProgresArcPainter oldDelegate) => false;
}

      /// CLİPPER ///

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();

    path.moveTo(-20, -20);
    path.lineTo(-20, h/2+20);
    path.lineTo(w+20, h/2+20);
    path.lineTo(w+20, -20);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

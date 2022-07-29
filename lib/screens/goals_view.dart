import 'package:flutter/material.dart';
import '../widgets/circular_arc.dart';

class GoalsView extends StatelessWidget {
  const GoalsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularArc(
        size: 100,
        strokeWidth: 24,
      ),
    );
  }
}
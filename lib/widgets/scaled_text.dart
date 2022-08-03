import 'dart:math';

import 'package:done_app/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ScaledText extends StatelessWidget {
  const ScaledText({Key? key, required this.text, this.style, this.textAlign}) : super(key: key);

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor(context),
      overflow: TextOverflow.fade,
    );
  }

  static double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
    final width = context.dynamicWidth(1);
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget wrapPadding(EdgeInsets edgeInsets) => Padding(padding: edgeInsets, child: this,);
  Widget wrapAlign(AlignmentGeometry alignment) => Align(alignment: alignment, child: this,);
  Widget wrapFitted() => FittedBox(child: this,);
}
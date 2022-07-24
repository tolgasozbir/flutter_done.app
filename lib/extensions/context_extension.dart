import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get _height => mediaQuery.size.height;
  double get _width => mediaQuery.size.width;
  double dynamicWidth(double val) => _width * val;
  double dynamicHeight(double val) => _height * val;
}

extension WidgetExtension on Widget {
  Widget wrapPadding(EdgeInsets edgeInsets) => Padding(padding: edgeInsets, child: this,) ;
}
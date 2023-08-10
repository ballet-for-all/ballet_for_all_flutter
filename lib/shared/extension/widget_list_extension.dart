import 'package:flutter/material.dart';

extension WidgetListExtension on List<Widget> {
  List<Widget> withSeperator(Widget seperator) {
    final List<Widget> result = [];
    for (var i = 0; i < length; i++) {
      result.add(this[i]);
      if (i != length - 1) {
        result.add(seperator);
      }
    }
    return result;
  }
}

import 'package:flutter/material.dart';

Color getColor(BuildContext context, double percent) {
  if (percent >= 0.75) {
    return Colors.green;
  } else if (percent >= 0.35) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
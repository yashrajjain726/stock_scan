import 'package:flutter/material.dart';

Color checkColor(String colorName) {
  if (colorName == "green") {
    return Colors.green;
  } else if (colorName == "red") {
    return Colors.red;
  }
  return Colors.white;
}

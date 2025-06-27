import 'package:flutter/material.dart';

TextStyle boldText({required double size, required Color color}) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.bold,
    color: color,
  );
}

TextStyle mediumText({required double size, required Color color}) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.normal,
    color: color,
    height: 1.2
  );
}
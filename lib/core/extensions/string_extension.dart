import 'package:flutter/material.dart';

extension StringExtension on String {
  String toFirstUpperCase() {
    return trim()
        .split(' ')
        .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
        .join(' ');
  }

  Color get color {
    var newString = this;
    switch (length) {
      case 7:
        newString = replaceFirst('#', 'FF');
      case 9:
        newString = replaceFirst('#', '');
      default:
        throw Exception('Invalid Color');
    }
    return Color(int.parse(newString, radix: 16));
  }
}

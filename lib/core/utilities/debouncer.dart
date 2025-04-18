import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  Debouncer._();

  static Timer? _timer;

  static Timer? run(VoidCallback action) {
    _timer?.cancel();
    return _timer = Timer(const Duration(milliseconds: 500), () {
      action();
      _timer?.cancel();
    });
  }
}

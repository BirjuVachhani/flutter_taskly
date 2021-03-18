// Author: Birju Vachhani
// Created Date: March 18, 2021

import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    if (kReleaseMode) return;
    try {
      final encoder = JsonEncoder.withIndent('  ');
      final jsonData = json.decode(rec.message);
      final prettyPrint = encoder.convert(jsonData);
      dev.log(
        prettyPrint,
        time: rec.time,
        level: rec.level.value,
        error: rec.error,
        stackTrace: rec.stackTrace,
        name: 'Network I/O',
      );
    } catch (e) {
      dev.log(
        rec.message,
        time: rec.time,
        level: rec.level.value,
        error: rec.error,
        stackTrace: rec.stackTrace,
        name: 'Network I/O',
      );
    }
  });
}

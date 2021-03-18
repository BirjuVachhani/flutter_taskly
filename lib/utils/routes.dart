// Author: Birju Vachhani
// Created Date: March 18, 2021

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/home/home_screen.dart';
import '../modules/home/home_screen_store.dart';

class Routes {
  Routes._();

  static PageRoute get homeScreen => MaterialPageRoute(
      builder: (_) =>
          Provider(create: (_) => HomeScreenStore(), child: HomeScreen()));
}

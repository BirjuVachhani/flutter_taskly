// Author: Birju Vachhani
// Created Date: March 18, 2021

import 'package:get_it/get_it.dart';

import '../apibase/repository.dart';

final locator = GetIt.instance;

void setupGetIt() {
  locator.registerSingleton<Repository>(Repository());
}

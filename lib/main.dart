import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'modules/splash/splash_screen.dart';
import 'utils/helpers.dart';
import 'utils/locator.dart';
import 'values/colors.dart';

void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  binding.renderView.automaticSystemUiAdjustment = false;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  setupGetIt();
  if (!kReleaseMode) {
    setupLogging();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Taskly',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: AppColors.accentColor,
          backgroundColor: Colors.white,
        ),
        home: SplashScreen(),
      );
}

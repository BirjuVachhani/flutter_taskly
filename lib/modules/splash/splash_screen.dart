// Author: Birju Vachhani
// Created Date: March 18, 2021

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info/package_info.dart';

import '../../utils/routes.dart';
import '../../values/colors.dart';
import '../../values/resources.dart';

/// Represents app splash screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.accentColor,
    ));
    Timer(Duration(seconds: 2), _navigateToHomeScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Image.asset(
                Images.splash,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 16,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      Vectors.logo,
                      width: 88,
                    ),
                    Text(
                      'Taskly',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: SafeArea(
                child: FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (_, snapshot) => Center(
                    child: AnimatedOpacity(
                      opacity: snapshot.hasData ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 500),
                      child: Text(
                        snapshot.data?.version ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToHomeScreen() {
    Navigator.of(context).pushReplacement(Routes.homeScreen);
  }
}

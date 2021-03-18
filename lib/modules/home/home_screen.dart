// Author: Birju Vachhani
// Created Date: March 18, 2021

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../values/enums.dart';
import 'home_screen_store.dart';
import 'project_created_dialog.dart';
import 'project_grid_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenStore store;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
    ));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store ??= Provider.of<HomeScreenStore>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 120),
        child: AppBar(
          shadowColor: Colors.grey.withOpacity(0.1),
          backgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme,
          primary: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            title: Text(
              'Projects',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: PageTransitionSwitcher(
            transitionBuilder: (child, animation, secondaryAnimation) =>
                FadeThroughTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
            ),
            child: Observer(
              builder: (_) {
                switch (store.state) {
                  case NetworkState.loading:
                    return Center(child: CircularProgressIndicator());
                  case NetworkState.failure:
                    return Center(child: Text(store.serverError ?? ''));
                  case NetworkState.success:
                    return ProjectsGridView(projects: store.projects);
                  default:
                    return Container();
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.all(8),
            primary: Theme.of(context).accentColor,
            minimumSize: Size(48, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: _showDialog,
          child: Icon(
            Icons.add,
            size: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    ProjectCreatedDialog(message: 'Project created successfully!')
        .show(context);
  }
}

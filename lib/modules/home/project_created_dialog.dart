// Author: Birju Vachhani
// Created Date: March 18, 2021

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../values/colors.dart';

class ProjectCreatedDialog extends StatelessWidget {
  final String message;

  const ProjectCreatedDialog({Key key, @required this.message})
      : super(key: key);

  Future<void> show(BuildContext context) {
    return showModal(context: context, builder: (_) => Container(child: this));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Material(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Success!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                message,
                style: TextStyle(
                  letterSpacing: 0.4,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 44),
                  primary: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.maybePop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

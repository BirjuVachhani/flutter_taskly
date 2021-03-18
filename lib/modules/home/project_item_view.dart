// Author: Birju Vachhani
// Created Date: March 18, 2021

import 'package:flutter/material.dart';

import '../../models/project.dart';

class ProjectItemView extends StatelessWidget {
  final Project project;

  const ProjectItemView({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){},
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          child: Center(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Icon(
                            Icons.favorite,
                            size: 18,
                            color: project.favorite ? Colors.red : Colors.white,
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 16,
                          child: Text(
                            project.name[0],
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    project.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.4,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

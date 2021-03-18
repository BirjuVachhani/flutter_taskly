// Author: Birju Vachhani
// Created Date: March 18, 2021

import 'package:flutter/material.dart';

import '../../models/project.dart';
import 'project_item_view.dart';

class ProjectsGridView extends StatelessWidget {
  final List<Project> projects;

  const ProjectsGridView({Key key, this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(right: 24, left: 24, top: 40, bottom: 8),
      itemCount: projects.length,
      itemBuilder: (_, index) => ProjectItemView(project: projects[index]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.20,
      ),
    );
  }
}

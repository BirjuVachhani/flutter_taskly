// Author: Birju Vachhani
// Created Date: March 18, 2021

import 'package:mobx/mobx.dart';

import '../../apibase/repository.dart';
import '../../models/project.dart';
import '../../utils/locator.dart';
import '../../values/enums.dart';

part 'home_screen_store.g.dart';

class HomeScreenStore = _HomeScreenStore with _$HomeScreenStore;

abstract class _HomeScreenStore with Store {
  _HomeScreenStore() {
    fetchAllProjects();
  }

  @observable
  NetworkState state = NetworkState.idle;

  @observable
  String serverError;

  @observable
  ObservableList<Project> projects = ObservableList.of([]);

  Future<void> fetchAllProjects() async {
    state = NetworkState.loading;
    try {
      final result = await locator<Repository>().fetchAllProjects();
      if (result.isSuccessful) {
        final newProjects = <Project>[];
        for (final item in result.body) {
          newProjects.add(Project.fromJson(item));
        }
        projects.clear();
        projects.addAll(newProjects);
        state = NetworkState.success;
      } else {
        serverError = result.error?.toString() ?? 'Unable to load data!';
        state = NetworkState.failure;
      }
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      serverError = 'Unable to load data!';
      state = NetworkState.failure;
    }
  }
}

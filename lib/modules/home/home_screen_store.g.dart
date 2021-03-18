// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeScreenStore on _HomeScreenStore, Store {
  final _$stateAtom = Atom(name: '_HomeScreenStore.state');

  @override
  NetworkState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(NetworkState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$serverErrorAtom = Atom(name: '_HomeScreenStore.serverError');

  @override
  String get serverError {
    _$serverErrorAtom.reportRead();
    return super.serverError;
  }

  @override
  set serverError(String value) {
    _$serverErrorAtom.reportWrite(value, super.serverError, () {
      super.serverError = value;
    });
  }

  final _$projectsAtom = Atom(name: '_HomeScreenStore.projects');

  @override
  ObservableList<Project> get projects {
    _$projectsAtom.reportRead();
    return super.projects;
  }

  @override
  set projects(ObservableList<Project> value) {
    _$projectsAtom.reportWrite(value, super.projects, () {
      super.projects = value;
    });
  }

  @override
  String toString() {
    return '''
state: ${state},
serverError: ${serverError},
projects: ${projects}
    ''';
  }
}

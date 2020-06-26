// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReposController on _ReposControllerBase, Store {
  final _$valueAtom = Atom(name: '_ReposControllerBase.value');

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$reposAtom = Atom(name: '_ReposControllerBase.repos');

  @override
  ObservableList<String> get repos {
    _$reposAtom.reportRead();
    return super.repos;
  }

  @override
  set repos(ObservableList<String> value) {
    _$reposAtom.reportWrite(value, super.repos, () {
      super.repos = value;
    });
  }

  final _$_ReposControllerBaseActionController =
      ActionController(name: '_ReposControllerBase');

  @override
  void setValue(String val) {
    final _$actionInfo = _$_ReposControllerBaseActionController.startAction(
        name: '_ReposControllerBase.setValue');
    try {
      return super.setValue(val);
    } finally {
      _$_ReposControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
repos: ${repos}
    ''';
  }
}

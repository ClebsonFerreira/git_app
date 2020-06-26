import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'repos_controller.g.dart';

class ReposController = _ReposControllerBase with _$ReposController;

abstract class _ReposControllerBase with Store {
  final _dio = Modular.get<Dio>();

  @observable
  String value = '';

  @observable
  ObservableList<String> repos = <String>[].asObservable();

  @action
  void setValue(String val) {
    value = val;
    _getAll(val);
  }

  _getAll(String value) async {
    var response =
        await _dio.get("https://api.github.com/users/${value.trim()}/repos");
    if (response.statusCode != 200) {
      print('clebson');
      repos = <String>[].asObservable();
    } else {
      for (var item in response.data as List) {
        repos.add("Nome:${item["name"]} -- Forks: ${item["forks"]} -- Estrelas : ${item["stargazers_count"]} ");
      }
    }
  }
}

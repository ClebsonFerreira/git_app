import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  var text = "";

  @action
  setText(String value) => text = value;

  @action
  void search() {
    Modular.to.pushNamed('/repo/${text}');
  }
}

import 'package:dio/dio.dart';

import 'repos_controller.dart' show ReposController;
import 'package:flutter_modular/flutter_modular.dart';
import 'repos_page.dart';

class ReposModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ReposController()),
        Bind((i) => Dio()),
      ];

  @override
  List<Router> get routers => [
        Router("/:text", child: (_, args) => ReposPage(name: args.params['text'],)),
      ];

  static Inject get to => Inject<ReposModule>.of();
}

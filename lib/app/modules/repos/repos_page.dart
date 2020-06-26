import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'repos_controller.dart';

class ReposPage extends StatefulWidget {
  final String title;
  final String name;
  const ReposPage({Key key, this.title = "Repos", this.name}) : super(key: key);

  @override
  _ReposPageState createState() => _ReposPageState();
}

class _ReposPageState extends ModularState<ReposPage, ReposController> {
  //use 'controller' variable to access controller
  final _controller = Modular.get<ReposController>();
  @override
  void initState() {
    _controller.setValue(widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Lista de repositorios")
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
            itemCount: controller.repos.length,
            itemBuilder: (_, index) {
              if (controller.repos.length == 0) {
                return CircularProgressIndicator();
              } else {
                return ListTile(
                    leading:
                        Image.network(controller.repos[index].owner.avatarUrl),
                    title: Text(
                      "${controller.repos[index].name}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.star, color: Colors.yellow),
                            Text(
                              "${controller.repos[index].stargazersCount}",
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.usb),
                            Text(
                              "${controller.repos[index].forks}",
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: controller.repos[index].forks >= 100
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                          ));
              }
            });
      }),
    );
  }
}

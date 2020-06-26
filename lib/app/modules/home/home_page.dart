import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  final HomeController _controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      height: double.infinity,
      width: double.infinity,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Image.network(
            "https://image.flaticon.com/icons/png/512/25/25231.png",
            color: Colors.white,
            height: 150,
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Observer(
              builder: (_) {
                return TextField(
                   onChanged: _controller.setText,
                  autofocus: false,
                  style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Username of github',
                    contentPadding:
                        EdgeInsets.only(left: 40, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            color: Colors.transparent,
            onPressed: _controller.search,
            textColor: Colors.white,
            padding: EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text('Search Repository',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:xPuzzle/screens/game/game_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'Médio (4x4)';

  void _iniciarJogo(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter X-Puzzle')),
        body: Center(
          child: Column(children: <Widget>[
            Spacer(flex: 5),
            Expanded(
                flex: 8,
                child: Column(children: <Widget>[
                  Text("Flutter X-Puzzle"),
                  RaisedButton(
                      onPressed: () => _iniciarJogo(context),
                      child: Text('Jogar')),
                ])),
            Expanded(
                flex: 1,
                child: Text('feito por MateusCFC',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)))
          ]),
        ));
  }
}

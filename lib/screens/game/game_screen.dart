import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/number_board.dart';

/// Página que contém componentes referentes ao jogo
class GameScreen extends StatelessWidget {
  final String _dificuldade;

  GameScreen(this._dificuldade);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter X-Puzzle'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'X-Puzzle',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )
                  ],
                ),
                flex: 1),
            NumberBoard(_dificuldade),
            Spacer(flex: 1)
          ],
        )));
  }
}

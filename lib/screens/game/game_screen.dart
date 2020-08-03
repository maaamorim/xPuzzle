import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/number_board.dart';

/// Página que contém componentes referentes ao jogo
class GameScreen extends StatefulWidget {
  final String _dificuldade;

  GameScreen(this._dificuldade);

  @override
  _GameScreenState createState() => _GameScreenState(_dificuldade);
}

class _GameScreenState extends State<GameScreen> {
  final String _dificuldade;

  Stopwatch _relogio = Stopwatch();
  String _tempoTranscorrido = '00:00:00';

  _GameScreenState(this._dificuldade);

  @override
  void initState() {
    _relogio.start();
    _iniciarRelogio();
    super.initState();
  }

  /// Sobrescrita do setState que impede erros ao se atualizar o estado quando se sai da
  /// tela do jogo
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  /// Inicia o relógio com incrementos de um segundo
  void _iniciarRelogio() {
    Timer(const Duration(seconds: 1), _callbackRelogioExecutando);
  }

  /// Atualiza o valor do relógio a cada segundo
  void _callbackRelogioExecutando() {
    if (_relogio.isRunning) {
      _iniciarRelogio();
    }
    setState(() {
      _tempoTranscorrido = _relogio.elapsed.inHours.toString().padLeft(2, '0') +
          ':' +
          (_relogio.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
          ':' +
          (_relogio.elapsed.inSeconds % 60).toString().padLeft(2, '0');
    });
  }

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
                      _tempoTranscorrido,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )
                  ],
                ),
                flex: 2),
            NumberBoard(_dificuldade),
            Spacer(flex: 1)
          ],
        )));
  }
}

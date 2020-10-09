import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/number_board.dart';
import 'package:xPuzzle/constants.dart' as Constants;

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
  int _quantidadeJogadas = 0;

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

  void _incrementarQuantidadeJogadas() {
    setState(() {
      _quantidadeJogadas++;
    });
  }

  /// Verifica se usuário venceu o jogo, recebendo [matrizNumeros] após
  /// todos os movimentos feitos
  void _verificarVitoria(List<List<int>> matrizNumeros) async {
    List<int> _listaMatrizNumeros = List();
    matrizNumeros.forEach((linhaNumero) {
      _listaMatrizNumeros.addAll(linhaNumero);
    });
    List<int> _listaVitoria = [
      for (var i = 1; i < matrizNumeros.length * matrizNumeros.length; i++) i
    ];
    _listaVitoria.add(0);
    if (_verificarIgualdade(_listaVitoria, _listaMatrizNumeros)) {
      _relogio.stop();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String _registroHistorico =
          '${DateTime.now().toString().split('.')[0]},$_tempoTranscorrido,$_quantidadeJogadas';
      String _historico = prefs.getString('historico-$_dificuldade');
      if (_historico != null) {
        prefs.setString(
          'historico-$_dificuldade',
          _registroHistorico + '\n' + _historico,
        );
      } else {
        prefs.setString(
          'historico-$_dificuldade',
          _registroHistorico,
        );
      }
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Parabéns!'),
                content: Text('Você venceu.\n\n'
                        'Tempo: ' +
                    _tempoTranscorrido +
                    '\nQuantidade de Jogadas: ' +
                    _quantidadeJogadas.toString()),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () => {
                            Navigator.popUntil(
                                context, (route) => route.isFirst)
                          },
                      child: Text('Ok!'))
                ],
              ),
          barrierDismissible: false);
    }
  }

  /// Verifica igualdade entre duas listas [l1] e [l2]
  bool _verificarIgualdade(List<int> l1, List<int> l2) {
    var i = -1;
    return l1.every((elemento) {
      i++;
      return l2[i] == elemento;
    });
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
        backgroundColor: Constants.BACKGROUND,
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
                      style: TextStyle(color: Constants.TEXT, fontSize: 30),
                    ),
                    Text(
                      'Jogadas: ' + _quantidadeJogadas.toString(),
                      style: TextStyle(color: Constants.TEXT, fontSize: 30),
                    )
                  ],
                ),
                flex: 2),
            NumberBoard(
                _dificuldade, _verificarVitoria, _incrementarQuantidadeJogadas),
            Spacer(flex: 1)
          ],
        )));
  }
}

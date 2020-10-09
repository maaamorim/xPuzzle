import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xPuzzle/screens/game/game_screen.dart';
import 'package:xPuzzle/screens/history/history_screen.dart';
import 'package:xPuzzle/screens/home/components/difficulty_dropdown_button.dart';
import 'package:xPuzzle/constants.dart' as Constants;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _valorSelecionado = Constants.DIFICULDADES[1];

  void _iniciarJogo(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen(_valorSelecionado)),
    );
  }

  void _abrirHistorico(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoryScreen()),
    );
  }

  void _atualizarValorSelecionado(String novoValor) {
    setState(() {
      _valorSelecionado = novoValor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.BACKGROUND,
        appBar: AppBar(title: Text('Flutter X-Puzzle')),
        body: Center(
          child: Column(children: <Widget>[
            Spacer(flex: 7),
            Expanded(
                flex: 10,
                child: Column(children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(bottom: 50),
                      child:
                          DifficultyDropdownButton(_atualizarValorSelecionado)),
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 50.0,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.transparent)),
                        color: Constants.TEXT,
                        onPressed: () => _iniciarJogo(context),
                        child: Text('Jogar',
                            style:
                                TextStyle(fontSize: 22, color: Colors.white))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                    child: Text('Histórico'),
                    onPressed: () => _abrirHistorico(context),
                  )
                ])),
            Expanded(
                flex: 1,
                child: Text.rich(TextSpan(
                    text: 'feito por ',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      TextSpan(
                          text: 'maaamorim',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                launch('https://github.com/maaamorim/xPuzzle'),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue))
                    ])))
          ]),
        ));
  }
}

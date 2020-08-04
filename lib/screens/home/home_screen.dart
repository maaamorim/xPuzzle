import 'package:flutter/material.dart';
import 'package:xPuzzle/screens/game/game_screen.dart';
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
            Spacer(flex: 5),
            Expanded(
                flex: 12,
                child: Column(children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Text('X-Puzzle',
                          style:
                              TextStyle(fontSize: 30, color: Constants.TEXT))),
                  Container(
                      padding: EdgeInsets.only(bottom: 50),
                      child:
                          DifficultyDropdownButton(_atualizarValorSelecionado)),
                  ButtonTheme(
                    minWidth: 140.0,
                    height: 50.0,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.transparent)),
                        color: Constants.TEXT,
                        onPressed: () => _iniciarJogo(context),
                        child: Text('Jogar',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white))),
                  )
                ])),
            Expanded(
                flex: 1,
                child: Text('feito por MateusCFC',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)))
          ]),
        ));
  }
}

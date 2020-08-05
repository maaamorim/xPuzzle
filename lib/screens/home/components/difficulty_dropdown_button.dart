import 'package:flutter/material.dart';
import 'package:xPuzzle/constants.dart' as Constants;

class DifficultyDropdownButton extends StatefulWidget {
  final Function(String) _callbackAtualizarValor;

  DifficultyDropdownButton(this._callbackAtualizarValor);

  @override
  _DifficultyDropdownButtonState createState() =>
      _DifficultyDropdownButtonState(_callbackAtualizarValor);
}

class _DifficultyDropdownButtonState extends State<DifficultyDropdownButton> {
  String _valorSelecionado = Constants.DIFICULDADES[1];
  Function(String) _callbackAtualizarValor;

  _DifficultyDropdownButtonState(this._callbackAtualizarValor);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _valorSelecionado,
      icon: Icon(Icons.arrow_downward, color: Constants.TEXT),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Constants.TEXT, fontSize: 22),
      underline: Container(
        height: 2,
        color: Constants.TEXT,
      ),
      onChanged: (String novoValor) {
        _callbackAtualizarValor(novoValor);
        setState(() {
          _valorSelecionado = novoValor;
        });
      },
      items:
          Constants.DIFICULDADES.map<DropdownMenuItem<String>>((String valor) {
        return DropdownMenuItem<String>(
          value: valor,
          child: Text(valor, style: TextStyle(color: Constants.TEXT)),
        );
      }).toList(),
    );
  }
}

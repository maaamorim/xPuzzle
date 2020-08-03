import 'package:flutter/material.dart';

/// Componente que representa um bloco com número
class NumberBlock extends StatelessWidget {
  final String _numero;
  final Function(String) _f;

  NumberBlock(this._numero, this._f);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: FlatButton(
              onPressed: () => {_f(_numero)},
              child: Text(
                _numero,
                style: TextStyle(fontSize: 22, color: Colors.blue),
              )),
          decoration: BoxDecoration(border: Border.all(color: Colors.blue))),
    );
  }
}

import 'package:flutter/material.dart';

/// Componente que representa um bloco com número
class NumberBlock extends StatelessWidget {
  final String _numero;

  NumberBlock(this._numero);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: FlatButton(
              onPressed: null,
              child: Text(
                _numero,
                style: TextStyle(fontSize: 22, color: Colors.blue),
              )),
          decoration: BoxDecoration(border: Border.all(color: Colors.blue))),
    );
  }
}

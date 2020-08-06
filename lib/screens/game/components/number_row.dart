import 'package:flutter/material.dart';
import 'number_block.dart';

/// Componente que representa uma linha de números
class NumberRow extends StatelessWidget {
  final List<int> _numeros;
  final Function(int) __callbackApertarBotao;
  final int _dimensao;

  NumberRow(this._numeros, this.__callbackApertarBotao, this._dimensao);

  List<Widget> _gerarNumeros() {
    List<Widget> _listaNumeros = List();
    _numeros.forEach((numero) {
      _listaNumeros.add(NumberBlock(numero, __callbackApertarBotao, _dimensao));
    });
    return _listaNumeros;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _gerarNumeros(),
        ));
  }
}

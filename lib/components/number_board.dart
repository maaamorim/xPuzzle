import 'package:flutter/material.dart';
import 'package:xPuzzle/components/number_row.dart';

/// Componente que representa o tabuleiro de números
class NumberBoard extends StatefulWidget {
  @override
  _NumberBoardState createState() => _NumberBoardState();
}

class _NumberBoardState extends State<NumberBoard> {
  List<String> _numeros = List();

  @override
  void initState() {
    _gerarNumeros();
    super.initState();
  }

  /// Gera a lista de números com valores embaralhados
  void _gerarNumeros() {
    _numeros = [for (var i = 1; i < 16; i++) i.toString()];
    _numeros.add('');
    _numeros.shuffle();
  }

  /// Gera as linhas de números a partir da divisão da lista de números
  List<Widget> _gerarLinhas() {
    List<Widget> _linhas = List();
    _linhas.add(NumberRow(_numeros.sublist(0, 4)));
    _linhas.add(NumberRow(_numeros.sublist(4, 8)));
    _linhas.add(NumberRow(_numeros.sublist(8, 12)));
    _linhas.add(NumberRow(_numeros.sublist(12, 16)));
    return _linhas;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _gerarLinhas(),
        ),
        flex: 4);
  }
}

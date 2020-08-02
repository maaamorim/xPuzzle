import 'package:flutter/material.dart';
import 'package:xPuzzle/components/number_row.dart';

/// Componente que representa o tabuleiro de números
class NumberBoard extends StatefulWidget {
  @override
  _NumberBoardState createState() => _NumberBoardState();
}

class _NumberBoardState extends State<NumberBoard> {
  List<List<String>> _numeros = List<List<String>>();

  @override
  void initState() {
    _gerarNumeros();
    super.initState();
  }

  /// Callback enviada para os botões que recebe ação de apertar o botão,
  /// indicando o botão apertado em [botao]
  void _apertarBotao(String botao) {
    print(_recuperarPosicao(botao));
  }

  /// Recupera a posição de [numero] na matriz de números, retornando uma
  /// lista no formato [linha, coluna]
  List<int> _recuperarPosicao(String numero) {
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 4; j++) {
        if (_numeros[i][j] == numero) {
          return [i, j];
        }
      }
    }
    throw ('Número não encontrado');
  }

  /// Gera a lista de números com valores embaralhados
  void _gerarNumeros() {
    List<String> _listaNumeros = [for (var i = 1; i < 16; i++) i.toString()];
    _listaNumeros.add('');
    _listaNumeros.shuffle();
    _numeros.add(_listaNumeros.sublist(0, 4));
    _numeros.add(_listaNumeros.sublist(4, 8));
    _numeros.add(_listaNumeros.sublist(8, 12));
    _numeros.add(_listaNumeros.sublist(12, 16));
  }

  /// Gera as linhas de números a partir da divisão da lista de números
  List<Widget> _gerarLinhas() {
    List<Widget> _linhas = List();
    _linhas.add(NumberRow(_numeros[0], _apertarBotao));
    _linhas.add(NumberRow(_numeros[1], _apertarBotao));
    _linhas.add(NumberRow(_numeros[2], _apertarBotao));
    _linhas.add(NumberRow(_numeros[3], _apertarBotao));
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

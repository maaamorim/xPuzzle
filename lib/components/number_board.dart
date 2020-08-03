import 'package:flutter/material.dart';
import 'package:xPuzzle/components/number_row.dart';

/// Componente que representa o tabuleiro de números
class NumberBoard extends StatefulWidget {
  @override
  _NumberBoardState createState() => _NumberBoardState();
}

class _NumberBoardState extends State<NumberBoard> {
  List<List<String>> _matrizNumeros = List<List<String>>();
  List<Widget> _widgetMatrizNumeros = List();

  @override
  void initState() {
    _gerarMatrizNumeros();
    _widgetMatrizNumeros = _gerarWidgetMatrizNumeros();
    super.initState();
  }

  /// Callback enviada para os botões que recebe ação de apertar o botão,
  /// indicando o botão apertado em [botao]
  void _apertarBotao(String botao) {
    List<int> _posicao = _recuperarPosicao(botao);
    String _direcao = _direcaoMovimento(_posicao);
    if (_direcao != 'X') {
      _movimentarNaDirecao(_posicao, _direcao);
    }
  }

  /// Recupera a posição de [numero] na matriz de números, retornando uma
  /// lista no formato [linha, coluna]
  List<int> _recuperarPosicao(String numero) {
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 4; j++) {
        if (_matrizNumeros[i][j] == numero) {
          return [i, j];
        }
      }
    }
    throw ('Número não encontrado');
  }

  /// Faz a movimentação do número que está na [posicao] na [direcao] informada
  void _movimentarNaDirecao(List<int> posicao, String direcao) {
    int _i = posicao[0];
    int _j = posicao[1];
    String _auxiliar = _matrizNumeros[_i][_j];
    List<int> _posicaoDirecao = _recuperarPosicao('');
    setState(() {
      _matrizNumeros[_i][_j] = '';
      _matrizNumeros[_posicaoDirecao[0]][_posicaoDirecao[1]] = _auxiliar;
      _widgetMatrizNumeros = _gerarWidgetMatrizNumeros();
    });
  }

  /// Retorna a possível direção que o elemento na [posicao] poderá se mover,
  /// no formato 'W' (para cima), 'D' (direita), 'S' (baixo), 'A' (esquerda) ou 'X'
  /// caso o elemento não possa se mover
  String _direcaoMovimento(List<int> posicao) {
    List<String> _movimentos = List();
    _movimentos.addAll([
      _buscarElementoNaDirecao(posicao, 'W'),
      _buscarElementoNaDirecao(posicao, 'A'),
      _buscarElementoNaDirecao(posicao, 'S'),
      _buscarElementoNaDirecao(posicao, 'D'),
    ]);
    for (var i = 0; i < 4; i++) {
      if (_movimentos[i] == '') {
        if (i == 0) return 'W';
        if (i == 3) return 'A';
        if (i == 2) return 'S';
        if (i == 1) return 'D';
      }
    }
    return 'X';
  }

  /// Retorna o elemento na [direcao] indicada ('W', 'A', 'S', 'D') tomando
  /// as referencias definidas pela lista [posicoes] no formato (i, j)
  String _buscarElementoNaDirecao(List<int> posicao, String direcao) {
    int _i = posicao[0];
    int _j = posicao[1];
    try {
      switch (direcao) {
        case 'W':
          return _matrizNumeros[_i - 1][_j];
          break;
        case 'A':
          return _matrizNumeros[_i][_j - 1];
          break;
        case 'S':
          return _matrizNumeros[_i + 1][_j];
          break;
        case 'D':
          return _matrizNumeros[_i][_j + 1];
          break;
        default:
          throw ('Direção inválida');
      }
    } on RangeError {
      return 'X';
    }
  }

  /// Gera a matriz de números com valores embaralhados ou a partir de uma determinada
  /// [lista] passada como argumento
  void _gerarMatrizNumeros([List<String> lista]) {
    List<String> _listaNumeros;
    if (lista == null) {
      _listaNumeros = [for (var i = 1; i < 16; i++) i.toString()];
    } else {
      _listaNumeros = lista;
    }
    _listaNumeros.add('');
    _listaNumeros.shuffle();
    _matrizNumeros.add(_listaNumeros.sublist(0, 4));
    _matrizNumeros.add(_listaNumeros.sublist(4, 8));
    _matrizNumeros.add(_listaNumeros.sublist(8, 12));
    _matrizNumeros.add(_listaNumeros.sublist(12, 16));
  }

  /// Gera as linhas de números a partir da divisão da lista de números
  List<Widget> _gerarWidgetMatrizNumeros() {
    List<Widget> _linhas = List();
    _linhas.add(NumberRow(_matrizNumeros[0], _apertarBotao));
    _linhas.add(NumberRow(_matrizNumeros[1], _apertarBotao));
    _linhas.add(NumberRow(_matrizNumeros[2], _apertarBotao));
    _linhas.add(NumberRow(_matrizNumeros[3], _apertarBotao));
    return _linhas;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _widgetMatrizNumeros),
        flex: 4);
  }
}

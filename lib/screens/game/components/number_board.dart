import 'package:flutter/material.dart';
import 'number_row.dart';
import 'package:xPuzzle/constants.dart' as Constants;

/// Componente que representa o tabuleiro de números
class NumberBoard extends StatefulWidget {
  final String _dificuldade;
  final Function(List<List<int>>) _callbackVerificarVitoria;
  final Function _callbackQuantidadeJogadas;

  NumberBoard(this._dificuldade, this._callbackVerificarVitoria,
      this._callbackQuantidadeJogadas);

  @override
  _NumberBoardState createState() => _NumberBoardState(
      _dificuldade, _callbackVerificarVitoria, this._callbackQuantidadeJogadas);
}

class _NumberBoardState extends State<NumberBoard> {
  String _dificuldade;
  int _dimensaoMatriz;

  List<List<int>> _matrizNumeros = List<List<int>>();
  List<Widget> _widgetMatrizNumeros = List();

  Function(List<List<int>>) _callbackVerificarVitoria;
  Function _callbackQuantidadeJogadas;

  _NumberBoardState(this._dificuldade, this._callbackVerificarVitoria,
      this._callbackQuantidadeJogadas);

  @override
  void initState() {
    _dimensaoMatriz = Constants.DIFICULDADES.indexOf(_dificuldade) + 3;
    _gerarMatrizNumeros(_dimensaoMatriz);
    _widgetMatrizNumeros = _gerarWidgetMatrizNumeros();
    super.initState();
  }

  /// Callback enviada para os botões que recebe ação de apertar o botão,
  /// indicando o botão apertado em [botao]
  void _apertarBotao(int botao) {
    _callbackQuantidadeJogadas();
    List<int> _posicao = _recuperarPosicao(botao);
    String _direcao = _direcaoMovimento(_posicao);
    if (_direcao != 'X') {
      _movimentarNaDirecao(_posicao, _direcao);
    }
  }

  /// Recupera a posição de [numero] na matriz de números, retornando uma
  /// lista no formato [linha, coluna]
  List<int> _recuperarPosicao(int numero) {
    for (var i = 0; i < _dimensaoMatriz; i++) {
      for (var j = 0; j < _dimensaoMatriz; j++) {
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
    int _auxiliar = _matrizNumeros[_i][_j];
    List<int> _posicaoDirecao = _recuperarPosicao(0);
    setState(() {
      _matrizNumeros[_i][_j] = 0;
      _matrizNumeros[_posicaoDirecao[0]][_posicaoDirecao[1]] = _auxiliar;
      _widgetMatrizNumeros = _gerarWidgetMatrizNumeros();
    });
    _callbackVerificarVitoria(_matrizNumeros);
  }

  /// Retorna a possível direção que o elemento na [posicao] poderá se mover,
  /// no formato 'W' (para cima), 'D' (direita), 'S' (baixo), 'A' (esquerda) ou 'X'
  /// caso o elemento não possa se mover
  String _direcaoMovimento(List<int> posicao) {
    List<int> _movimentos = List();
    _movimentos.addAll([
      _buscarElementoNaDirecao(posicao, 'W'),
      _buscarElementoNaDirecao(posicao, 'A'),
      _buscarElementoNaDirecao(posicao, 'S'),
      _buscarElementoNaDirecao(posicao, 'D'),
    ]);
    for (var i = 0; i < 4; i++) {
      if (_movimentos[i] == 0) {
        if (i == 0) return 'W';
        if (i == 1) return 'A';
        if (i == 2) return 'S';
        if (i == 3) return 'D';
      }
    }
    return 'X';
  }

  /// Retorna o elemento na [direcao] indicada ('W', 'A', 'S', 'D') tomando
  /// as referencias definidas pela lista [posicoes] no formato (i, j)
  int _buscarElementoNaDirecao(List<int> posicao, String direcao) {
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
          return -1;
      }
    } on RangeError {
      return -1;
    }
  }

  /// Gera a matriz de números com dimensão [dimensao] e com valores
  /// embaralhados ou a partir de uma determinada [lista] passada como argumento
  void _gerarMatrizNumeros(int dimensao) {
    int _tamanho = dimensao * dimensao;
    List<int> _listaNumeros = _gerarListaNumerosInicial(_tamanho);
    for (var i = 0; i < _tamanho; i += dimensao) {
      var fim = (i + dimensao < _tamanho) ? i + dimensao : _tamanho;
      _matrizNumeros.add(_listaNumeros.sublist(i, fim));
    }
  }

  /// Gera a lista inicial dos números, que servirá como base para a matriz de números,
  /// a partir de um [tamanho]
  List<int> _gerarListaNumerosInicial(int tamanho) {
    if (Constants.DEBUG_MODE) {
      return Constants.DEBUG_ARRAY;
    }
    List<int> _lista = List();
    do {
      _lista = [for (var i = 0; i < tamanho; i++) i];
      _lista.shuffle();
    } while (!_verificarListaSolucionavel(_lista));
    return _lista;
  }

  /// Verifica se a lista [estadoInicial] é solucionável dentro das regras do jogo
  /// Baseado em https://jvm-gaming.org/t/the-impossible-15-puzzle/53369/14
  bool _verificarListaSolucionavel(List<int> estadoInicial) {
    int _tamanho = estadoInicial.length;
    List<int> _posicoes = List(_tamanho);
    for (int i = 0; i < _tamanho; i++) {
      _posicoes[estadoInicial[i]] = (i + 1) % _tamanho;
    }

    int _linha = (_posicoes[0] - 1) ~/ 4;
    int _coluna = (_posicoes[0] - 1) - _linha * 4;
    bool _estadoPar = _posicoes[0] == 0 || _linha % 2 == _coluna % 2;

    int _ciclosPares = 0;
    List<bool> _visitado = [for (var i = 0; i < _tamanho; i++) false];
    for (int i = 0; i < _tamanho; i++) {
      if (_visitado[i]) {
        continue;
      }
      int tamanhoCiclo = 0;
      int proximoBloco = i;
      while (!_visitado[proximoBloco]) {
        tamanhoCiclo++;
        _visitado[proximoBloco] = true;
        proximoBloco = _posicoes[proximoBloco];
      }
      if (tamanhoCiclo % 2 == 0) {
        _ciclosPares++;
      }
    }
    return _estadoPar == (_ciclosPares % 2 == 0);
  }

  /// Gera as linhas de números a partir da divisão da lista de números
  List<Widget> _gerarWidgetMatrizNumeros() {
    List<Widget> _linhas = List();
    _matrizNumeros.forEach((lista) {
      _linhas.add(NumberRow(lista, _apertarBotao, _dimensaoMatriz));
    });
    return _linhas;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _widgetMatrizNumeros),
        flex: 6);
  }
}

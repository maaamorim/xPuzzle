import 'package:flutter/material.dart';

/// Componente que representa um bloco com número
class NumberBlock extends StatelessWidget {
  final int _numero;
  final Function(int) _callbackApertarBotao;
  final int _dimensao;

  NumberBlock(this._numero, this._callbackApertarBotao, this._dimensao);

  /// Retorna o tamanho do texto do botão baseado no valor da dimensão da
  /// matriz contido em _dimensao
  double _gerarTamanhoTextoBotao() {
    if (_dimensao == 3) return 36;
    if (_dimensao == 4) return 32;
    if (_dimensao == 5) return 28;
    if (_dimensao == 6) return 24;
    throw ('Erro ao gerar tamanho do botão');
  }

  /// Renderiza o número no bloco do widget, fazendo tratamento de zero
  String _renderizarNumero() {
    if (_numero != 0) {
      return _numero.toString();
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: RaisedButton(
              onPressed: () => {_callbackApertarBotao(_numero)},
              child: Text(
                _renderizarNumero(),
                style: TextStyle(
                    fontSize: _gerarTamanhoTextoBotao(), color: Colors.blue),
              )),
          decoration: BoxDecoration(border: Border.all(color: Colors.blue))),
    );
  }
}

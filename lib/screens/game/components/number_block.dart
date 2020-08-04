import 'package:flutter/material.dart';

/// Componente que representa um bloco com número
class NumberBlock extends StatelessWidget {
  final String _numero;
  final Function(String) _callbackApertarBotao;
  final int _dimensao;

  NumberBlock(this._numero, this._callbackApertarBotao, this._dimensao);

  /// Retorna o tamanho do texto do botão baseado no valor da dimensão da
  /// matriz contido em _dimensao
  double _gerarTamanhoTextoBotao() {
    if (_dimensao == 3) return 32;
    if (_dimensao == 4) return 26;
    if (_dimensao == 5) return 24;
    if (_dimensao == 6) return 22;
    throw ('Erro ao gerar tamanho do botão');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: FlatButton(
              onPressed: () => {_callbackApertarBotao(_numero)},
              child: Text(
                _numero,
                style: TextStyle(
                    fontSize: _gerarTamanhoTextoBotao(), color: Colors.blue),
              )),
          decoration: BoxDecoration(border: Border.all(color: Colors.blue))),
    );
  }
}

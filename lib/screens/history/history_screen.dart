import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xPuzzle/constants.dart' as Constants;
import 'package:xPuzzle/screens/home/components/difficulty_dropdown_button.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String _valorSelecionado = Constants.DIFICULDADES[1];

  void _atualizarValorSelecionado(String novoValor) {
    setState(() {
      _valorSelecionado = novoValor;
    });
  }

  Future<String> _retornarValorHistorico() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('historico-$_valorSelecionado');
  }

  Widget _gerarTextoTabela(String texto) {
    return Center(child: Text(texto));
  }

  Future<Table> _gerarTabelaHistorico() async {
    List<TableRow> _tabela = [];
    String _valorHistorico = await _retornarValorHistorico();
    _tabela.add(TableRow(children: [
      _gerarTextoTabela('Data e hora'),
      _gerarTextoTabela('Tempo'),
      _gerarTextoTabela('# jogadas')
    ]));
    if (_valorHistorico == null) {
      _tabela.add(TableRow(children: [
        _gerarTextoTabela('Vazio'),
        _gerarTextoTabela('Vazio'),
        _gerarTextoTabela('Vazio')
      ]));
    } else {
      List<String> _valoresHistorico = _valorHistorico.split('\n');
      _valoresHistorico.forEach((valor) {
        _tabela.add(TableRow(children: [
          _gerarTextoTabela(valor.split(',')[0]),
          _gerarTextoTabela(valor.split(',')[1]),
          _gerarTextoTabela(valor.split(',')[2])
        ]));
      });
    }
    return Table(
        children: _tabela,
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder.all(width: 1.0, color: Colors.black));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
      ),
      backgroundColor: Constants.BACKGROUND,
      body: Center(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 50),
                child: DifficultyDropdownButton(_atualizarValorSelecionado)),
            FutureBuilder(
              future: _gerarTabelaHistorico(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 45),
                    child: snapshot.data,
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

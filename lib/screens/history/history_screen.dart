import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xPuzzle/constants.dart' as Constants;

class HistoryScreen extends StatelessWidget {
  void _lerHistorico() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Constants.DIFICULDADES.forEach((dificuldade) {
      String _historicoDificuldade = prefs.getString('historico-$dificuldade');
      print(dificuldade);
      print(_historicoDificuldade);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Histórico'),
            FlatButton(
              child: Text('teste'),
              onPressed: () => _lerHistorico(),
            )
          ],
        ),
      ),
    );
  }
}

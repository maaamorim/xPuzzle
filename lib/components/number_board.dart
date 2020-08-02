import 'package:flutter/material.dart';
import 'package:xPuzzle/components/number_row.dart';

/// Componente que representa o tabuleiro de números
class NumberBoard extends StatefulWidget {
  @override
  _NumberBoardState createState() => _NumberBoardState();
}

class _NumberBoardState extends State<NumberBoard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            NumberRow(['1', '2', '3', '4']),
            NumberRow(['5', '6', '7', '8']),
            NumberRow(['9', '10', '11', '12']),
            NumberRow(['13', '14', '15', '']),
          ],
        ),
        flex: 4);
  }
}

import 'package:flutter/material.dart';
import 'package:xPuzzle/screens/home/home_screen.dart';

void main() {
  runApp(XPuzzleApp());
}

class XPuzzleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter X-Puzzle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

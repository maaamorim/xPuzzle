import 'package:flutter/material.dart';

void main() {
  runApp(XPuzzleApp());
}

class XPuzzleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Flutter X-Puzzle'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "X-Puzzle",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )
                  ],
                ),
                flex: 1),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('1')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('2')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('3')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('4')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('5')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('6')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('7')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('8')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('9')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('10')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('11')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('12')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('13')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('14')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('15')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                      onPressed: null, child: Text('')),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue))),
                            ),
                          ],
                        ))
                  ],
                ),
                flex: 4),
            Spacer(flex: 1)
          ],
        ),
      ),
    );
  }
}

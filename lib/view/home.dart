import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            RaisedButton(
              child: Text('メンバー作成'),
              onPressed: () {
                Navigator.of(context).pushNamed('/make_members');
              },
            ),
            RaisedButton(
              child: Text('グループ作成'),
              onPressed: () {
                Navigator.of(context).pushNamed('/make_members');
              },
            ),
          ],
        )));
  }
}

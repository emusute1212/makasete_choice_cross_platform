import 'package:flutter/material.dart';

import 'make_members.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'まかせて★チョイス',
        theme: ThemeData.dark(),
        home: MyHomePage(title: 'まかせて★︎チョイス'),
        routes: <String, WidgetBuilder>{
          '/make_members': (BuildContext context) =>
              MakeMembersPage(title: 'メンバー作成ページ'),
        });
  }
}

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
        )
      )
    );
  }
}

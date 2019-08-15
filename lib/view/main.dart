import 'package:flutter/material.dart';

import 'home.dart';
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

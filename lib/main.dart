import 'package:flutter/material.dart';
import 'package:makasete_choice_cross_platform/view/home.dart';
import 'package:makasete_choice_cross_platform/view/make_group.dart';
import 'package:makasete_choice_cross_platform/view/make_members.dart';

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
          '/make_group': (BuildContext context) =>
              MakeGroupPage(title: 'グループ作成ページ'),
        });
  }
}

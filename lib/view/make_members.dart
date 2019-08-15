import 'package:flutter/material.dart';

class MakeMembersPage extends StatefulWidget {
  MakeMembersPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MakeMembersPage createState() => _MakeMembersPage();
}

class _MakeMembersPage extends State<MakeMembersPage> {
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
            Text(
              'めんばーさくせいページ',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}

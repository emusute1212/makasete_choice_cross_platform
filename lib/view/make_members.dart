import 'package:flutter/material.dart';

class MakeMembersPage extends StatefulWidget {
  MakeMembersPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MakeMembersPage createState() => _MakeMembersPage();
}

class _MakeMembersPage extends State<MakeMembersPage> {
  final _textController = TextEditingController();

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
            TextField(
              enabled: true,
              maxLines: 1,
              controller: _textController,
            ),
            RaisedButton(
              child: Text('＋'),
              onPressed: () {
                print("add : " + _textController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}

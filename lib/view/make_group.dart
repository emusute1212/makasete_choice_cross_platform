import 'package:flutter/material.dart';

class MakeGroupPage extends StatefulWidget {
  MakeGroupPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MakeGroupPage createState() => _MakeGroupPage();
}

class _MakeGroupPage extends State<MakeGroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(),
      ),
    );
  }
}

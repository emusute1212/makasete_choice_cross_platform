import 'package:flutter/material.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/add_member_creator.dart';
import 'package:makasete_choice_cross_platform/store/member_store.dart';

class MakeMembersPage extends StatefulWidget {
  MakeMembersPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MakeMembersPage createState() => _MakeMembersPage();
}

class _MakeMembersPage extends State<MakeMembersPage> {
  final _textController = TextEditingController();
  AddMemberCreator _addMemberCreator = AddMemberCreator();
  MemberStore _memberStore = MemberStore();

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
                setState(() {
                _addMemberCreator.addMember(_textController.text);
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Text(_memberStore.members[index].getName());
                },
                itemCount: _memberStore.members.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

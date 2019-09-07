import 'package:flutter/material.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/add_member_action_creator.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/init_member_action_creator.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/remove_member_action_creator.dart';
import 'package:makasete_choice_cross_platform/store/member_store.dart';

class MakeMembersPage extends StatefulWidget {
  MakeMembersPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MakeMembersPage createState() => _MakeMembersPage();
}

class _MakeMembersPage extends State<MakeMembersPage> {
  final _textController = TextEditingController();
  final InitMemberActionCreator _initMemberCreator = InitMemberActionCreator();
  final AddMemberActionCreator _addMemberCreator = AddMemberActionCreator();
  final RemoveMemberActionCreator _removeMemberCreator = RemoveMemberActionCreator();
  final MemberStore _memberStore = MemberStore();

  @override
  void initState() {
    super.initState();
    _initMemberCreator.initMember();
  }

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
              child: ListView(
                children: _memberStore.getMembers().map((member) {
                  return Dismissible(
                    key: Key(member.getIndex().toString()),
                    child: ListTile(
                      title: Text(member.getName()),
                    ),
                    background: Container(color: Colors.red),
                    confirmDismiss: (direction) async {
                      return true;
                    },
                    onDismissed: (direction) {
                      setState(() {
                        _removeMemberCreator.removeMember(member.getIndex());
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

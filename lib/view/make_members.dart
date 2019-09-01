import 'package:flutter/material.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/add_member_creator.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/init_member_creator.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/remove_member_creator.dart';
import 'package:makasete_choice_cross_platform/store/member_store.dart';

class MakeMembersPage extends StatefulWidget {
  MakeMembersPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MakeMembersPage createState() => _MakeMembersPage();
}

class _MakeMembersPage extends State<MakeMembersPage> {
  final _textController = TextEditingController();
  InitMemberCreator _initMemberCreator = InitMemberCreator();
  AddMemberCreator _addMemberCreator = AddMemberCreator();
  RemoveMemberCreator _removeMemberCreator = RemoveMemberCreator();
  MemberStore _memberStore = MemberStore();

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
                children: _memberStore.members.map((member) {
                  return Dismissible(
                    key: Key(member.getIndex().toString()),
                    child: ListTile(
                      title: Text(member.getName()),
                    ),
                    background: Container(color: Colors.red),
                    confirmDismiss: (direction) async {
                      // ここで確認を行う
                      // Future<bool> で確認結果を返す
                      // False の場合削除されない
                      return true;
                    },
                    onDismissed: (direction) {
                      // 削除アニメーションが完了し、リサイズが終了したときに呼ばれる
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

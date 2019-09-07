import 'package:flutter/material.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/grouping_action_creator.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/init_member_action_creator.dart';
import 'package:makasete_choice_cross_platform/data/entity/grouping_member_entity.dart';
import 'package:makasete_choice_cross_platform/store/group_store.dart';

class MakeGroupPage extends StatefulWidget {
  MakeGroupPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MakeGroupPage createState() => _MakeGroupPage();
}

class _MakeGroupPage extends State<MakeGroupPage> {
  final InitMemberActionCreator _initMemberCreator = InitMemberActionCreator();
  final GroupingActionCreator _groupingCreator = GroupingActionCreator();
  final GroupStore _groupStore = GroupStore();
  List<DropdownMenuItem<String>> _dropDownMenuItems = [];
  int _splitNumber = 0;

  @override
  void initState() {
    super.initState();
    _initMemberCreator.initMember();
    _dropDownMenuItems = List<DropdownMenuItem<String>>.generate(
      _groupStore.getMembers().length,
      (i) => DropdownMenuItem(
            value: (i + 1).toString(),
            child: Text((i + 1).toString()),
          ),
    );
    _splitNumber = _groupStore.getMembers().length;
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
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Text(_groupStore.getMembers()[index].getName());
                },
                itemCount: _groupStore.getMembers().length,
              ),
            ),
            DropdownButton(
              items: _dropDownMenuItems,
              onChanged: (value) {
                setState(() {
                  _splitNumber = int.parse(value);
                });
              },
              value: _splitNumber.toString(),
            ),
            RaisedButton(
              child: Text('チョイス★する！'),
              onPressed: () {
                setState(() {
                  _groupingCreator.groupMember(
                      _groupStore.getMembers(), _splitNumber);
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  GroupingMemberEntity team =
                      _groupStore.getGroupingMembers()[index];
                  return Text("チーム " +
                      team.getName() +
                      ": " +
                      team.getMembers().map<String>((member) {
                        return member.getName();
                      }).join(", "));
                },
                itemCount: _groupStore.getGroupingMembers().length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/grouping_creator.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/init_member_creator.dart';
import 'package:makasete_choice_cross_platform/store/group_store.dart';

class MakeGroupPage extends StatefulWidget {
  MakeGroupPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MakeGroupPage createState() => _MakeGroupPage();
}

class _MakeGroupPage extends State<MakeGroupPage> {
  final InitMemberCreator _initMemberCreator = InitMemberCreator();
  final GroupingCreator _groupingCreator = GroupingCreator();
  final GroupStore _groupStore = GroupStore();
  List<DropdownMenuItem<String>> _dropDownMenuItems = [];
  int _splitNumber = 0;

  @override
  void initState() {
    super.initState();
    _initMemberCreator.initMember();
    _dropDownMenuItems = new List<DropdownMenuItem<String>>.generate(
      _groupStore.getMembers().length,
      (i) => DropdownMenuItem(
            value: i.toString(),
            child: Text((i + 1).toString()),
          ),
    );
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
                print(value);
                setState(() {
                  _splitNumber = int.parse(value);
                });
              },
              value: _splitNumber.toString(),
            ),
          ],
        ),
      ),
    );
  }
}

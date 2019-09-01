import 'package:makasete_choice_cross_platform/action/action.dart';
import 'package:makasete_choice_cross_platform/data/entity/grouping_member_entity.dart';
import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';
import 'package:makasete_choice_cross_platform/di/component.dart';
import 'package:makasete_choice_cross_platform/dispatcher/callback.dart';
import 'package:makasete_choice_cross_platform/dispatcher/dispatcher.dart';
import 'package:makasete_choice_cross_platform/dispatcher/payload.dart';

class GroupStore {
  List<MemberEntity> _members = [];
  Dispatcher dispatcher;
  List<GroupingMemberEntity> _groupingMembers = [];

  GroupStore() {
    Component().injectGroupStore(this);
    dispatcher.register(_InitMemberCallback(this));
    dispatcher.register(_GroupingMemberCallback(this));
  }

  List<MemberEntity> getMembers() {
    return this._members;
  }

  List<GroupingMemberEntity> getGroupingMembers() {
    return this._groupingMembers;
  }
}

class _InitMemberCallback extends Callback {
  GroupStore _store;

  _InitMemberCallback(GroupStore store) {
    this._store = store;
  }

  @override
  void invoke(Payload payload) {
    if (payload.getAction() != Action.INIT_MEMBER) {
      return;
    }
    _store._members = payload.getValue();
  }
}

class _GroupingMemberCallback extends Callback {
  GroupStore _store;

  _GroupingMemberCallback(GroupStore store) {
    this._store = store;
  }

  @override
  void invoke(Payload payload) {
    if (payload.getAction() != Action.GROUPING) {
      return;
    }
    _store._groupingMembers = payload.getValue();
  }
}
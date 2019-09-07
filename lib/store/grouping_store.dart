import 'package:makasete_choice_cross_platform/action/action.dart';
import 'package:makasete_choice_cross_platform/data/entity/grouping_member_entity.dart';
import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';
import 'package:makasete_choice_cross_platform/di/component.dart';
import 'package:makasete_choice_cross_platform/dispatcher/callback.dart';
import 'package:makasete_choice_cross_platform/dispatcher/dispatcher.dart';
import 'package:makasete_choice_cross_platform/dispatcher/payload.dart';

class GroupingStore {
  List<MemberEntity> _members = [];
  Dispatcher dispatcher;
  List<GroupingMemberEntity> _groupingMembers = [];

  GroupingStore() {
    Component().injectGroupingStore(this);
    dispatcher.register(_InitMemberCallback(this));
    dispatcher.register(_GroupingMemberCallback(this));
  }

  List<MemberEntity> getMembers() {
    return List<MemberEntity>.unmodifiable(this._members);
  }

  List<GroupingMemberEntity> getGroupingMembers() {
    return List<GroupingMemberEntity>.unmodifiable(this._groupingMembers);
  }
}

class _InitMemberCallback extends Callback {
  GroupingStore _store;

  _InitMemberCallback(GroupingStore store) {
    this._store = store;
  }

  @override
  void invoke(Payload payload) {
    if (payload.getAction() != Action.INIT_MEMBER) {
      return;
    }
    // 同じファイル内だと、別クラスのプライベートメンバにアクセスできるので、
    // それを用いてパッケージプライベート的な挙動を模倣している
    // (言語仕様によって変更される恐れがあるので注意)
    _store._members = payload.getValue();
  }
}

class _GroupingMemberCallback extends Callback {
  GroupingStore _store;

  _GroupingMemberCallback(GroupingStore store) {
    this._store = store;
  }

  @override
  void invoke(Payload payload) {
    if (payload.getAction() != Action.GROUPING) {
      return;
    }
    // 同じファイル内だと、別クラスのプライベートメンバにアクセスできるので、
    // それを用いてパッケージプライベート的な挙動を模倣している
    // (言語仕様によって変更される恐れがあるので注意)
    _store._groupingMembers = payload.getValue();
  }
}

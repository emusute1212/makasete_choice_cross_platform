import 'package:makasete_choice_cross_platform/action/action.dart';
import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';
import 'package:makasete_choice_cross_platform/di/component.dart';
import 'package:makasete_choice_cross_platform/dispatcher/callback.dart';
import 'package:makasete_choice_cross_platform/dispatcher/dispatcher.dart';
import 'package:makasete_choice_cross_platform/dispatcher/payload.dart';

class MemberStore {
  List<MemberEntity> _members = [];
  Dispatcher dispatcher;

  MemberStore() {
    Component().injectMemberStore(this);
    dispatcher.register(_InitMemberCallback(this));
    dispatcher.register(_AddMemberCallback(this));
    dispatcher.register(_RemoveMemberCallback(this));
  }

  List<MemberEntity> getMembers() {
    return List<MemberEntity>.unmodifiable(this._members);
  }
}

class _AddMemberCallback extends Callback {
  MemberStore _store;

  _AddMemberCallback(MemberStore store) {
    this._store = store;
  }

  @override
  void invoke(Payload payload) {
    if (payload.getAction() != Action.ADD_MEMBER) {
      return;
    }
    // 同じファイル内だと、別クラスのプライベートメンバにアクセスできるので、
    // それを用いてパッケージプライベート的な挙動を模倣している
    // (言語仕様によって変更される恐れがあるので注意)
    _store._members = payload.getValue();
  }
}

class _InitMemberCallback extends Callback {
  MemberStore _store;

  _InitMemberCallback(MemberStore store) {
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

class _RemoveMemberCallback extends Callback {
  MemberStore _store;

  _RemoveMemberCallback(MemberStore store) {
    this._store = store;
  }

  @override
  void invoke(Payload payload) {
    if (payload.getAction() != Action.REMOVE_MEMBER) {
      return;
    }
    // 同じファイル内だと、別クラスのプライベートメンバにアクセスできるので、
    // それを用いてパッケージプライベート的な挙動を模倣している
    // (言語仕様によって変更される恐れがあるので注意)
    _store._members = payload.getValue();
  }
}

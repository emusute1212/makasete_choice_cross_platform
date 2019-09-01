import 'package:makasete_choice_cross_platform/action/action.dart';
import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';
import 'package:makasete_choice_cross_platform/di/component.dart';
import 'package:makasete_choice_cross_platform/dispatcher/callback.dart';
import 'package:makasete_choice_cross_platform/dispatcher/dispatcher.dart';
import 'package:makasete_choice_cross_platform/dispatcher/payload.dart';

class MemberStore {
  List<MemberEntity> members = [];
  Dispatcher dispatcher;

  MemberStore() {
    Component().injectMemberStore(this);
    dispatcher.register(InitMemberCallback(this));
    dispatcher.register(AddMemberCallback(this));
    dispatcher.register(RemoveMemberCallback(this));
  }
}

class AddMemberCallback extends Callback {
  MemberStore _store;

  AddMemberCallback(MemberStore store) {
    this._store = store;
  }

  @override
  void invoke(Payload payload) {
    if (payload.getAction() != Action.ADD_MEMBER) {
      return;
    }
    _store.members = payload.getValue();
  }
}

class InitMemberCallback extends Callback {
  MemberStore _store;

  InitMemberCallback(MemberStore store) {
    this._store = store;
  }

  @override
  void invoke(Payload payload) {
    if (payload.getAction() != Action.INIT_MEMBER) {
      return;
    }
    _store.members = payload.getValue();
  }
}

class RemoveMemberCallback extends Callback {
  MemberStore _store;

  RemoveMemberCallback(MemberStore store) {
    this._store = store;
  }

  @override
  void invoke(Payload payload) {
    if (payload.getAction() != Action.REMOVE_MEMBER) {
      return;
    }
    _store.members = payload.getValue();
  }
}
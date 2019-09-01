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
    dispatcher.register(AddMemberCallback(this));
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

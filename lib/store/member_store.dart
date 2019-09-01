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
    dispatcher.register(AddMemberCallback(members));
  }
}

class AddMemberCallback extends Callback {
  List<MemberEntity> _members;

  AddMemberCallback(List<MemberEntity> members) {
    this._members = members;
  }

  @override
  void invoke(Payload payload) {
    if (payload.getAction() != Action.ADD_MEMBER) {
      return;
    }
    _members.add(MemberEntity(_members.length, payload.getValue()));
  }
}

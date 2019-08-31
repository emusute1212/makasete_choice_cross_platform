import 'package:makasete_choice_cross_platform/action/action.dart';
import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';
import 'package:makasete_choice_cross_platform/di/component.dart';
import 'package:makasete_choice_cross_platform/dispatcher/callback.dart';
import 'package:makasete_choice_cross_platform/dispatcher/dispatcher.dart';
import 'package:makasete_choice_cross_platform/dispatcher/payload.dart';

class MemberStore extends Callback {
  List<MemberEntity> members = [];
  Dispatcher dispatcher;

  MemberStore() {
    Component().injectMemberStore(this);
    dispatcher.register(this);
  }

  @override
  void invoke(Payload payload) {
    if (payload.getAction() != Action.ADD_MEMBER) {
      return;
    }
    members.add(MemberEntity(members.length, payload.getValue()));
  }
}

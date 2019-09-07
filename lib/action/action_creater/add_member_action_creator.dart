import 'package:makasete_choice_cross_platform/action/action.dart';
import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';
import 'package:makasete_choice_cross_platform/data/repository/member_repository.dart';
import 'package:makasete_choice_cross_platform/di/component.dart';
import 'package:makasete_choice_cross_platform/dispatcher/dispatcher.dart';
import 'package:makasete_choice_cross_platform/dispatcher/payload.dart';

class AddMemberActionCreator {
  MemberRepository repository;
  Dispatcher dispatcher;

  AddMemberActionCreator() {
    Component().injectAddMemberActionCreator(this);
  }

  void addMember(String memberName) {
    repository.addMember(memberName);
    Payload payload = Payload<List<MemberEntity>>(Action.ADD_MEMBER, repository.getMembers());
    dispatcher.dispatch(payload);
  }
}

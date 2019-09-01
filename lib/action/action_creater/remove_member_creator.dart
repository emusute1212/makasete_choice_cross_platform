import 'package:makasete_choice_cross_platform/action/action.dart';
import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';
import 'package:makasete_choice_cross_platform/data/repository/member_repository.dart';
import 'package:makasete_choice_cross_platform/di/component.dart';
import 'package:makasete_choice_cross_platform/dispatcher/dispatcher.dart';
import 'package:makasete_choice_cross_platform/dispatcher/payload.dart';

class RemoveMemberCreator {
  MemberRepository repository;
  Dispatcher dispatcher;

  RemoveMemberCreator() {
    Component().injectRemoveMemberCreator(this);
  }

  void removeMember(int index) {
    repository.removeMember(index);
    Payload payload = Payload<List<MemberEntity>>(
        Action.REMOVE_MEMBER, repository.getMembers());
    dispatcher.dispatch(payload);
  }
}

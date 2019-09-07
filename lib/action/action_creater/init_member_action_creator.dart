import 'package:makasete_choice_cross_platform/action/action.dart';
import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';
import 'package:makasete_choice_cross_platform/data/repository/member_repository.dart';
import 'package:makasete_choice_cross_platform/di/component.dart';
import 'package:makasete_choice_cross_platform/dispatcher/dispatcher.dart';
import 'package:makasete_choice_cross_platform/dispatcher/payload.dart';

class InitMemberActionCreator {
  MemberRepository repository;
  Dispatcher dispatcher;

  InitMemberActionCreator() {
    Component().injectInitMemberActionCreator(this);
  }

  void initMember() {
    Payload payload = Payload<List<MemberEntity>>(
        Action.INIT_MEMBER, repository.getMembers());
    dispatcher.dispatch(payload);
  }
}

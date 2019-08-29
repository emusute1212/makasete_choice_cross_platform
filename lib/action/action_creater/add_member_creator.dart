import 'package:makasete_choice_cross_platform/action/action.dart';
import 'package:makasete_choice_cross_platform/data/repository/member_repository.dart';
import 'package:makasete_choice_cross_platform/di/component.dart';
import 'package:makasete_choice_cross_platform/dispatcher/dispatcher.dart';
import 'package:makasete_choice_cross_platform/dispatcher/payload.dart';

class AddMemberCreator {
  MemberRepository repository;
  Dispatcher dispatcher;

  AddMemberCreator() {
    Component().injectAddMemberCreator(this);
  }

  void addMember(String memberName) {
    Payload payload = Payload<String>(Action.ADD_MEMBER, memberName);
    print(payload.getValue());
    dispatcher.dispatch(payload);
  }
}

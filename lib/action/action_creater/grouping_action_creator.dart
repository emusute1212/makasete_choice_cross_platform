import 'package:makasete_choice_cross_platform/action/action.dart';
import 'package:makasete_choice_cross_platform/data/entity/grouping_member_entity.dart';
import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';
import 'package:makasete_choice_cross_platform/data/repository/grouping_member_repository.dart';
import 'package:makasete_choice_cross_platform/di/component.dart';
import 'package:makasete_choice_cross_platform/dispatcher/dispatcher.dart';
import 'package:makasete_choice_cross_platform/dispatcher/payload.dart';
import 'package:makasete_choice_cross_platform/usecase/grouping_usecase.dart';

class GroupingActionCreator {
  GroupingMemberRepository repository;
  Dispatcher dispatcher;
  GroupingUsecase usecase;

  GroupingActionCreator() {
    Component().injectGroupingActionCreator(this);
  }

  void groupMember(List<MemberEntity> members, int splitNumber) {
    List<GroupingMemberEntity> groupingMembers =
        usecase.groupMember(members, splitNumber);
    repository.setGroupingMembers(groupingMembers);

    Payload payload = Payload<List<GroupingMemberEntity>>(
        Action.GROUPING, repository.getGroupingMembers());
    dispatcher.dispatch(payload);
  }
}

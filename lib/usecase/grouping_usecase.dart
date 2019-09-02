import 'dart:math';

import 'package:makasete_choice_cross_platform/data/entity/grouping_member_entity.dart';
import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';

class GroupingUsecase {
  List<GroupingMemberEntity> groupMember(
      List<MemberEntity> members, int splitNumber) {
    List<MemberEntity> shuffledMembers = List.from(members);
    List<GroupingMemberEntity> groupingMembers = [];

    shuffledMembers.shuffle(Random.secure());

    shuffledMembers.asMap().forEach((index, member) {
      int splitTarget = index % splitNumber;
      if (_containsIndex(groupingMembers, splitTarget)) {
        groupingMembers[splitTarget].getMembers().add(member);
      } else {
        groupingMembers.add(GroupingMemberEntity(index.toString(), [member]));
      }
    });

    return groupingMembers;
  }

  bool _containsIndex<T>(List<T> list, int indexTarget) {
    for (int i = 0; i < list.length; i++) {
      if (i == indexTarget) {
        return true;
      }
    }
    return false;
  }
}

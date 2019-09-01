import 'dart:math';

import 'package:makasete_choice_cross_platform/data/entity/grouping_member_entity.dart';
import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';

class GroupingUsecase {
  List<GroupingMemberEntity> groupMember(
      List<MemberEntity> members, int splitNumber) {
    List<MemberEntity> shuffledMembers = List.from(members);
    shuffledMembers.shuffle(Random.secure());
    List<GroupingMemberEntity> groupingMembers = [];

    shuffledMembers.asMap().map((index, member) {
      MapEntry<int, MemberEntity>(
          index % splitNumber, shuffledMembers[index % splitNumber]);
    }).forEach((index, members) {
      groupingMembers.add(GroupingMemberEntity(index, members));
    });

    return groupingMembers;
  }
}

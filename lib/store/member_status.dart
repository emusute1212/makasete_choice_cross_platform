import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';

class MemberStatus {
  List<MemberEntity> members = [];

  MemberStatus(List<MemberEntity> members) {
    this.members = members;
  }

  List<MemberEntity> getMembers() {
    return members;
  }
}

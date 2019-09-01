import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';

class GroupingMemberEntity {
  String _name;
  List<MemberEntity> _members;

  GroupingMemberEntity(String name, List<MemberEntity> members) {
    this._name = name;
    this._members = members;
  }

  String getName() {
    return this._name;
  }

  List<MemberEntity> getMembers() {
    return this._members;
  }

  @override
  String toString() {
    return "name: " + _name + ", members: " + _members.toString();
  }
}

import 'package:makasete_choice_cross_platform/data/entity/grouping_member_entity.dart';

class GroupingMemberRepository {
  List<GroupingMemberEntity> _cache = [];

  void setGroupingMembers(List<GroupingMemberEntity> groupingMembers) {
    _cache = List.from(groupingMembers);
  }

  List<GroupingMemberEntity> getGroupingMembers() {
    return List<GroupingMemberEntity>.unmodifiable(this._cache);
  }
}

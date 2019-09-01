import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';

class MemberRepository {
  final List<MemberEntity> _cache = [];

  void addMember(String member) {
    _cache.add(MemberEntity(_getIndexMax(_cache) + 1, member));
  }

  void removeMember(int index) {
    print("before: " + _cache.toString());
    _cache.removeWhere((member) => member.getIndex() == index);
    print("after: " + _cache.toString());
  }

  List<MemberEntity> getMembers() {
    return _cache;
  }

  int _getIndexMax(List<MemberEntity> target) {
    if (target.isEmpty) return 0;
    return target
        .reduce(
            (curr, next) => (curr.getIndex() > next.getIndex()) ? curr : next)
        .getIndex();
  }
}

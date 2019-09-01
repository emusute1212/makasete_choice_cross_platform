import 'package:makasete_choice_cross_platform/data/entity/member_entity.dart';

class MemberRepository {
  final List<MemberEntity> _cache = [];

  void addMember(String member) {
    _cache.add(MemberEntity(_cache.length - 1, member));
  }

  List<MemberEntity> getMembers() {
    return _cache;
  }
}

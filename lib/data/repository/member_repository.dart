class MemberRepository {
  final List<String> _cache = [];

  void addMember(String member) {
    _cache.add(member);
  }

  List<String> loadMember() {
    return _cache;
  }
}

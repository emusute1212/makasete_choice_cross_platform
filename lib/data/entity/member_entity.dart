class MemberEntity {
  int _index;
  String _name;

  MemberEntity(int index, String name) {
    this._index = index;
    this._name = name;
  }

  int getIndex() {
    return this._index;
  }

  String getName() {
    return this._name;
  }

  @override
  String toString() {
    return "index: " + _index.toString() + ", name: " + _name;
  }
}

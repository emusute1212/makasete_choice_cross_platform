import 'package:makasete_choice_cross_platform/data/repository/member_repository.dart';

import 'module.dart';

class MemberRepositoryModule extends Module {
  MemberRepository repository = MemberRepository();

  MemberRepository provideMemberRepository() {
    return repository;
  }
}

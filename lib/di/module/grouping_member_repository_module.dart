import 'package:makasete_choice_cross_platform/data/repository/grouping_member_repository.dart';

import 'module.dart';

class GroupingMemberRepositoryModule extends Module {
  GroupingMemberRepository repository = GroupingMemberRepository();

  GroupingMemberRepository provideGroupingMemberRepository() {
    return repository;
  }
}

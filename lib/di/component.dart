import 'package:makasete_choice_cross_platform/action/action_creater/add_member_creator.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/grouping_creator.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/init_member_creator.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/remove_member_creator.dart';
import 'package:makasete_choice_cross_platform/di/module/dispatcher_module.dart';
import 'package:makasete_choice_cross_platform/di/module/member_repository_module.dart';
import 'package:makasete_choice_cross_platform/di/module/module.dart';
import 'package:makasete_choice_cross_platform/store/group_store.dart';
import 'package:makasete_choice_cross_platform/store/member_store.dart';

import 'module/grouping_member_repository_module.dart';
import 'module/grouping_usecase_module.dart';

class Component {
  static final Component _singleton = new Component._internal();

  factory Component() {
    return _singleton;
  }

  Component._internal();

  Map<String, Module> _modules = {
    "MemberRepositoryModule": MemberRepositoryModule(),
    "DispatcherModule": DispatcherModule(),
    "GroupingUsecaseModule": GroupingUsecaseModule(),
    "GroupingMemberRepositoryModule": GroupingMemberRepositoryModule()
  };

  void injectAddMemberCreator(AddMemberCreator addMemberCreator) {
    addMemberCreator.repository =
        (_modules["MemberRepositoryModule"] as MemberRepositoryModule)
            .provideMemberRepository();
    addMemberCreator.dispatcher =
        (_modules["DispatcherModule"] as DispatcherModule).provideDispatcher();
  }

  void injectRemoveMemberCreator(RemoveMemberCreator removeMemberCreator) {
    removeMemberCreator.repository =
        (_modules["MemberRepositoryModule"] as MemberRepositoryModule)
            .provideMemberRepository();
    removeMemberCreator.dispatcher =
        (_modules["DispatcherModule"] as DispatcherModule).provideDispatcher();
  }

  void injectMemberStore(MemberStore memberStore) {
    memberStore.dispatcher =
        (_modules["DispatcherModule"] as DispatcherModule).provideDispatcher();
  }

  void injectInitMemberCreator(InitMemberCreator initMemberCreator) {
    initMemberCreator.repository =
        (_modules["MemberRepositoryModule"] as MemberRepositoryModule)
            .provideMemberRepository();
    initMemberCreator.dispatcher =
        (_modules["DispatcherModule"] as DispatcherModule).provideDispatcher();
  }

  void injectGroupStore(GroupStore groupStore) {
    groupStore.dispatcher =
        (_modules["DispatcherModule"] as DispatcherModule).provideDispatcher();
  }

  void injectGroupingCreator(GroupingCreator groupingCreator) {
    groupingCreator.repository = (_modules["GroupingMemberRepositoryModule"]
            as GroupingMemberRepositoryModule)
        .provideGroupingMemberRepository();
    groupingCreator.dispatcher =
        (_modules["DispatcherModule"] as DispatcherModule).provideDispatcher();
    groupingCreator.usecase =
        (_modules["GroupingUsecaseModule"] as GroupingUsecaseModule)
            .provideGroupingUsecase();
  }
}

import 'package:makasete_choice_cross_platform/action/action_creater/add_member_action_creator.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/grouping_action_creator.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/init_member_action_creator.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/remove_member_action_creator.dart';
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

  void injectAddMemberActionCreator(AddMemberActionCreator addMemberActionCreator) {
    addMemberActionCreator.repository =
        (_modules["MemberRepositoryModule"] as MemberRepositoryModule)
            .provideMemberRepository();
    addMemberActionCreator.dispatcher =
        (_modules["DispatcherModule"] as DispatcherModule).provideDispatcher();
  }

  void injectRemoveMemberActionCreator(RemoveMemberActionCreator removeMemberActionCreator) {
    removeMemberActionCreator.repository =
        (_modules["MemberRepositoryModule"] as MemberRepositoryModule)
            .provideMemberRepository();
    removeMemberActionCreator.dispatcher =
        (_modules["DispatcherModule"] as DispatcherModule).provideDispatcher();
  }

  void injectMemberStore(MemberStore memberStore) {
    memberStore.dispatcher =
        (_modules["DispatcherModule"] as DispatcherModule).provideDispatcher();
  }

  void injectInitMemberActionCreator(InitMemberActionCreator initMemberActionCreator) {
    initMemberActionCreator.repository =
        (_modules["MemberRepositoryModule"] as MemberRepositoryModule)
            .provideMemberRepository();
    initMemberActionCreator.dispatcher =
        (_modules["DispatcherModule"] as DispatcherModule).provideDispatcher();
  }

  void injectGroupStore(GroupStore groupStore) {
    groupStore.dispatcher =
        (_modules["DispatcherModule"] as DispatcherModule).provideDispatcher();
  }

  void injectGroupingActionCreator(GroupingActionCreator groupingActionCreator) {
    groupingActionCreator.repository = (_modules["GroupingMemberRepositoryModule"]
            as GroupingMemberRepositoryModule)
        .provideGroupingMemberRepository();
    groupingActionCreator.dispatcher =
        (_modules["DispatcherModule"] as DispatcherModule).provideDispatcher();
    groupingActionCreator.usecase =
        (_modules["GroupingUsecaseModule"] as GroupingUsecaseModule)
            .provideGroupingUsecase();
  }
}

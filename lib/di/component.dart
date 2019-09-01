import 'package:makasete_choice_cross_platform/action/action_creater/add_member_creator.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/init_member_creator.dart';
import 'package:makasete_choice_cross_platform/action/action_creater/remove_member_creator.dart';
import 'package:makasete_choice_cross_platform/di/module/dispatcher_module.dart';
import 'package:makasete_choice_cross_platform/di/module/member_repository_module.dart';
import 'package:makasete_choice_cross_platform/di/module/module.dart';
import 'package:makasete_choice_cross_platform/store/member_store.dart';

class Component {
  static final Component _singleton = new Component._internal();

  factory Component() {
    return _singleton;
  }

  Component._internal();

  Map<String, Module> _modules = {
    "MemberRepositoryModule": MemberRepositoryModule(),
    "DispatcherModule": DispatcherModule()
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
}

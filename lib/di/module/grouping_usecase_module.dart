import 'package:makasete_choice_cross_platform/di/module/module.dart';
import 'package:makasete_choice_cross_platform/usecase/grouping_usecase.dart';

class GroupingUsecaseModule extends Module {
  GroupingUsecase provideGroupingUsecase() {
    return GroupingUsecase();
  }
}

import 'package:makasete_choice_cross_platform/di/module/module.dart';
import 'package:makasete_choice_cross_platform/dispatcher/dispatcher.dart';

class DispatcherModule extends Module {
  Dispatcher dispatcher = Dispatcher();

  Dispatcher provideDispatcher() {
    return dispatcher;
  }
}

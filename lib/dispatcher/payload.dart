import 'package:makasete_choice_cross_platform/action/action.dart';

class Payload<T> {
  Action _action;
  T _value;

  Payload(Action action, T value) {
    _action = action;
    _value = value;
  }

  Action getAction() {
    return _action;
  }

  T getValue() {
    return _value;
  }
}

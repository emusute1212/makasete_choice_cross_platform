import 'package:makasete_choice_cross_platform/dispatcher/callback.dart';
import 'package:makasete_choice_cross_platform/dispatcher/payload.dart';

class Dispatcher {
  List<Callback> _callbacks = [];

  void register(Callback callback) {
    _callbacks.add(callback);
  }

  void dispatch(Payload payload) {
    _callbacks.forEach((callback) {
      callback.invoke(payload);
    });
  }
}

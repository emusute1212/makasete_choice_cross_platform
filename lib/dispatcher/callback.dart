import 'package:makasete_choice_cross_platform/dispatcher/payload.dart';

abstract class Callback {
  void invoke(Payload payload);
}

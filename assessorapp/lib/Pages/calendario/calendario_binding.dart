import 'package:get/get.dart';

import 'calendario_controller.dart';

class CalendarioBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalendarioController());
  }
}

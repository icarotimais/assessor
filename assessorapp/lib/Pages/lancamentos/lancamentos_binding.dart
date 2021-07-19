import 'package:assessorapp/Pages/lancamentos/lancamentos_controller.dart';
import 'package:assessorapp/database/LancamentosRepository.dart';
import 'package:get/get.dart';

class LancamentosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LancamentosController());
    Get.lazyPut(() => LancamentosRepository());
  }
}

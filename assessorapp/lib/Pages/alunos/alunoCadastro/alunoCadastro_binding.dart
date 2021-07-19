import 'package:assessorapp/database/AlunoRepository.dart';
import 'package:get/get.dart';
import 'alunoCadastro_controller.dart';

class AlunoCadastroBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlunoCadastroController());
    Get.lazyPut(() => AlunoRepository());
  }
}

import 'package:assessorapp/database/AlunoRepository.dart';
import 'package:get/get.dart';

import 'alunoCadastro/alunoCadastro_controller.dart';
import 'alunos_controller.dart';

class AlunosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlunosController());
    Get.lazyPut(() => AlunoCadastroController());
    Get.lazyPut(() => AlunoRepository());
  }
}

import 'package:assessorapp/database/AlunoRepository.dart';
import 'package:assessorapp/entities/aluno.dart';
import 'package:assessorapp/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AlunosController extends GetxController {
  final MenuController menuController = Get.find<MenuController>();
  final storage = GetStorage();
  final repository = Get.find<AlunoRepository>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await repository.init();
    this.buscaAlunos();
  }

  @override
  void onClose() {
    super.onClose();
  }

  buscaAlunos() async {
    this.alunos.clear();
    if (repository.db.values.isNotEmpty) {
      this
          .alunos
          .addAll(repository.getAlunos(menuController.idProfessor.value));
    } else {
      Get.showSnackbar(GetBar(
        maxWidth: Get.height * .4,
        title: "Consulta Alunos",
        message: "Nenhum Alunos encontrado",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        isDismissible: true,
        onTap: (value) {
          Get.back();
        },
        dismissDirection: SnackDismissDirection.HORIZONTAL,
      ));
    }
  }

  excluirAluno(Aluno aluno) async {
    await repository.delete(aluno.key);
    await this.buscaAlunos();
  }

  var alunos = RxList<Aluno>();
}

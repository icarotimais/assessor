import 'package:assessorapp/database/LancamentosRepository.dart';
import 'package:assessorapp/entities/lancamentos.dart';
import 'package:assessorapp/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LancamentosController extends GetxController {
  final MenuController menuController = Get.find<MenuController>();
  final repository = Get.find<LancamentosRepository>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await repository.init();
    this.buscaLancamentos();
  }

  @override
  void onClose() {
    super.onClose();
  }

  buscaLancamentos() async {
    this.lancamentos.clear();
    if (repository.db.values.isNotEmpty) {
      this
          .lancamentos
          .addAll(repository.getLancamentos(menuController.idProfessor.value));
    } else {
      Get.showSnackbar(GetBar(
        maxWidth: Get.height * .4,
        title: "Consulta Lancamentos",
        message: "Nenhum Lancamento encontrado",
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

  excluirLancamento(Lancamentos lancamento) async {
    await repository.delete(lancamento.key);
    await this.buscaLancamentos();
  }

  var lancamentos = RxList<Lancamentos>();
}

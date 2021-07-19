import 'package:assessorapp/entities/aluno.dart';
import 'package:assessorapp/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';

class CalendarioController extends GetxController {
  final MenuController menuController = Get.find<MenuController>();
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    menuController.paginaSelecionada.value = "Calendário";
    this.buscaCalendario();
  }

  @override
  void onClose() {
    super.onClose();
  }

  buscaCalendario() async {
    Box<Aluno> box;

    this.calendario.clear();
    if (!Hive.isBoxOpen('Calendario')) {
      box = await Hive.openBox<Aluno>('Calendario');
    } else {
      box = Hive.box('Calendario');
    }

    if (box.values.isNotEmpty) {
      this.calendario.addAll(box.toMap().values.where((element) =>
          element.idProfessor == menuController.idProfessor.value));
    } else {
      Get.snackbar("Consulta Calendario", "Nenhum Calendario encontrado",
          backgroundColor: Colors.grey,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  var calendario = RxList<Aluno>();
}

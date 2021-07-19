import 'package:assessorapp/entities/usuario.dart';
import 'package:assessorapp/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';

class LoginController extends GetxController {
  final MenuController menuController = Get.find<MenuController>();
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (storage.read("Id") != null) {
      menuController.isAuthenticated.value = true;
      Get.offAndToNamed('/home');
    } else {
      menuController.isAuthenticated.value = false;
    }
  }

  var login = "".obs;
  bool get loginValidate => login.isNotEmpty;
  String get msgLoginValidate =>
      !loginValidate ? "O login deve ser informado" : null;
  setLogin(String value) => login.value = value;

  var senha = "".obs;
  bool get senhaValidate => senha.isNotEmpty;
  String get msgSenhaValidate =>
      !senhaValidate ? "A senha deve ser informada" : null;
  setSenha(String value) => senha.value = value;

  bool get formValidate => loginValidate && senhaValidate;

  Future<void> entrar() async {
    if (formValidate) {
      Hive.openBox<Usuario>('usuarios').then((usuarios) {
        if (usuarios.isNotEmpty) {
          var usuario = usuarios.values.where((element) =>
              element.login == login.value && element.senha == senha.value);
          if (usuario.isNotEmpty) {
            if (usuario.first.key != null) {
              menuController.idProfessor.value = usuario.first.key;
              menuController.isAuthenticated.value = true;
              menuController.nome.value =
                  usuario.first.nome + " " + usuario.first.sobrenome;
              menuController.isAdmin.value = usuario.first.isAdmin.toString();
              storage.write("Id", usuario.first.key.toString());
              storage.write(
                  "Nome", usuario.first.nome + " " + usuario.first.sobrenome);
              storage.write("IsAdmin", usuario.first.isAdmin.toString());
              Get.offAndToNamed("/home");
            }
          } else {
            Get.snackbar("Login Error!", "Usuário inválido.",
                backgroundColor: Colors.white,
                snackPosition: SnackPosition.BOTTOM);
          }
        } else {
          usuarios.add(new Usuario('admin', '123', 'admin', 'master', true));
        }
      });
    }
  }
}

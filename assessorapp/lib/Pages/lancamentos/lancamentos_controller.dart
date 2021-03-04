import 'package:get/get.dart';

class LancamentosController extends GetxController {
  var login = "".obs;
  bool get loginValidate => login.isNotEmpty;
  String get msgLoginValidate => !loginValidate?"O login deve ser informado":null; 
  setLogin(String value) => login.value = value;

  var senha = "".obs;
  bool get senhaValidate => senha.isNotEmpty;
  String get msgSenhaValidate => !senhaValidate?"A senha deve ser informada":null;
  setSenha(String value) => senha.value = value; 
  
  bool get formValidate => loginValidate && senhaValidate;

  void entrar(){
    if(formValidate){
     Get.offAndToNamed("/home");
    }
  }


}
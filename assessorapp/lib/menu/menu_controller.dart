import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MenuController extends GetxController {
  final box = GetStorage();

  var paginaSelecionada = "".obs;

  var idProfessor = 0.obs;
  var isAuthenticated = false.obs;
  var nome = "".obs;
  var isAdmin = "".obs;
}

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MenuController extends GetxController {
  final box = GetStorage();
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    //box.write("Token", "teste");

    if(box.read("Token") != null)isAuthenticated.value = true;
    else{ 
      isAuthenticated.value = false;
    }
  }

  var isAuthenticated = false.obs;

}
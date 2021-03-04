
import 'dart:js';
import 'package:assessorapp/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Pages/home/home_binding.dart';
import 'Pages/home/home_view.dart';
import 'Pages/lancamentos/lancamentos_binding.dart';
import 'Pages/lancamentos/lancamentos_view.dart';
import 'Pages/login/login_binding.dart';
import 'Pages/login/login_view.dart';
import 'Widget/AdaptiveScaffold.dart';
import 'menu/menu.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(MenuController(), permanent: true);
 SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) =>
  runApp(GetMaterialApp(
    builder: (context, child){
      return Menu(child);
  },
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    getPages: [
      GetPage(name: '/login', page: () => LoginView(), binding: LoginBinding(), transition: Transition.fadeIn),
      GetPage(name: '/home', page: () => HomeView(), binding: HomeBinding(),transition: Transition.fadeIn),
      GetPage(name: '/lancamentos', page: () => LancamentosView(), binding: LancamentosBinding(),transition: Transition.fadeIn),
    ],
    theme: ThemeData(
       visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
          color: Color.fromRGBO(0, 213, 59, 1),
          textTheme: TextTheme(
              headline6: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              ),
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 5,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Color.fromRGBO(0, 213, 59, 1),
    ),
  )));
}

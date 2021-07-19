import 'package:assessorapp/Pages/alunos/alunoCadastro/alunoCadastro_binding.dart';
import 'package:assessorapp/Pages/calendario/calendario_binding.dart';
import 'package:assessorapp/Pages/calendario/calendario_view.dart';
import 'package:assessorapp/entities/lancamentos.dart';
import 'package:assessorapp/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';

import 'Pages/alunos/alunoCadastro/alunoCadastro_view.dart';
import 'Pages/alunos/alunos_binding.dart';
import 'Pages/alunos/alunos_view.dart';
import 'Pages/home/home_binding.dart';
import 'Pages/home/home_view.dart';
import 'Pages/lancamentos/lancamentos_binding.dart';
import 'Pages/lancamentos/lancamentos_view.dart';
import 'Pages/login/login_binding.dart';
import 'Pages/login/login_view.dart';
import 'entities/aluno.dart';
import 'entities/usuario.dart';
import 'menu/menu.dart';

final routes = [
  GetPage(
      title: "Login",
      name: '/login',
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.fade),
  GetPage(
      title: "Home",
      name: '/home',
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fade),
  GetPage(
      title: "Lançamentos",
      name: '/lancamentos',
      page: () => LancamentosView(),
      binding: LancamentosBinding(),
      transition: Transition.fade),
  GetPage(
      title: "Alunos",
      name: '/alunos',
      page: () => AlunosView(),
      binding: AlunosBinding(),
      transition: Transition.fade),
  GetPage(
      title: "Calendário",
      name: '/calendario',
      page: () => CalendarioView(),
      binding: CalendarioBinding(),
      transition: Transition.fade),
  GetPage(
      title: "Aluno detalhe",
      name: '/alunos-cadastro',
      page: () => AlunoCadastroView(),
      binding: AlunoCadastroBinding(),
      transition: Transition.fade),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(MenuController(), permanent: true);
  if (!GetPlatform.isWeb) {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  Hive.registerAdapter<Usuario>(UsuarioAdapter());
  Hive.registerAdapter<Aluno>(AlunoAdapter());
  Hive.registerAdapter<Lancamentos>(LancamentosAdapter());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(GetMaterialApp(
            builder: (context, child) {
              return Menu(child);
            },
            debugShowCheckedModeBanner: false,
            initialRoute: '/login',
            routingCallback: (routing) {
              if ((Get.isSnackbarOpen && !routing.isSnackbar) ||
                  (Get.isDialogOpen && !routing.isDialog) ||
                  (Get.isBottomSheetOpen && !routing.isBottomSheet))
                Get.back(closeOverlays: true);

              Get.find<MenuController>().paginaSelecionada.value = routes
                  .where((element) =>
                      element.name ==
                      (routing.current.contains("?")
                          ? routing.current.split("?")[0]
                          : routing.current))
                  .first
                  .title;
            },
            getPages: routes,
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: AppBarTheme(
                color: Color.fromRGBO(107, 43, 118, 1),
                textTheme: TextTheme(
                  headline6: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                actionsIconTheme: IconThemeData(color: Colors.white),
                iconTheme: IconThemeData(color: Colors.white),
                elevation: 5,
              ),
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Color.fromRGBO(107, 43, 118, 1),
            ),
          )));
}

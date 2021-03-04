import 'package:assessorapp/Widget/AdaptiveScaffold.dart';
import 'package:assessorapp/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class Menu extends StatefulWidget {
  Widget body;

  Menu(this.body);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  
  final MenuController menuController = Get.find<MenuController>();


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }



  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      isAltheticated: menuController.isAuthenticated.value,
      title: Icon(Icons.people,size: 150,),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () => _handleSignOut(),
            child: Text('Sair'),
          ),
        )
      ],
      destinations: [
        AdaptiveScaffoldDestination(title: 'Home', icon: Icons.home, onTapDestination: (){Get.toNamed('/home');}),
        AdaptiveScaffoldDestination(title: 'Lancamentos', icon: Icons.article, onTapDestination: (){Get.toNamed('/lancamentos');}),
      ],
      body: widget.body,
    );
  }

   Future<void> _handleSignOut() async {

    var shouldSignOut = await Get.dialog<bool>(
       AlertDialog(
        title: Text('Você deseja sair?'),
        actions: [
          TextButton(
            child: Text('Não'),
            onPressed: () {
              Get.back<bool>(result: false);
            },
          ),
          TextButton(
            child: Text('Sim'),
            onPressed: () {
               Get.back<bool>(result: true);
            },
          ),
        ],
      ),
    );

    if (!shouldSignOut) {
      return;
    }
    menuController.box.erase();
    menuController.isAuthenticated.value = false;
    Get.toNamed('/login');
  }
}
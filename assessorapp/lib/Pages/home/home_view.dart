import 'package:assessorapp/Pages/lancamentos/lancamentos_view.dart';
import 'package:assessorapp/Widget/AdaptiveScaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  int _pageIndex = 0;
  Widget body;

  HomeView({this.body});

  @override
  Widget build(BuildContext context) {
  
    return  Container(child: Text("Home"),);
  }
}

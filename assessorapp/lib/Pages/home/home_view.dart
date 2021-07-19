import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  Widget body;

  HomeView({this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Home"),
    );
  }
}

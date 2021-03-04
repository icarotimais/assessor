import 'package:assessorapp/Pages/home/home_view.dart';
import 'package:assessorapp/Widget/AdaptiveScaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lancamentos_controller.dart';


class LancamentosView extends GetView<LancamentosController> {
  @override
  Widget build(BuildContext context) {
    var alturaDevice = MediaQuery.of(context).size.height / 100;
    var larguraDevice = MediaQuery.of(context).size.width / 100;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        Container(
          height: alturaDevice * 50,
          width: larguraDevice * 100,
           decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Text("Lançamento"),
        ),
      ]),
    );
  }
}

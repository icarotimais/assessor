import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'alunos_controller.dart';

class AlunosView extends GetView<AlunosController> {
  @override
  Widget build(BuildContext context) {
    var alturaDevice = MediaQuery.of(context).size.height / 100;
    var larguraDevice = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: Get.height,
            child: Obx(() => ListView.builder(
                  itemCount: controller.alunos.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          controller.alunos[i].nome +
                              " " +
                              controller.alunos[i].sobrenome +
                              " - Situação: " +
                              (controller.alunos[i].iesAtivo
                                  ? "Ativo"
                                  : "Desativado"),
                          style: TextStyle(color: Colors.black),
                        ),
                        tileColor: controller.alunos[i].iesAtivo
                            ? Colors.white
                            : Colors.grey,
                        trailing: Wrap(
                          children: <Widget>[
                            RawMaterialButton(
                              constraints: BoxConstraints(minWidth: 20),
                              onPressed: () {
                                controller.excluirAluno(controller.alunos[i]);
                              },
                              child: Icon(Icons.close),
                              shape: CircleBorder(),
                            ),
                            RawMaterialButton(
                              constraints: BoxConstraints(minWidth: 20),
                              onPressed: () {
                                Get.toNamed("/alunos-cadastro", parameters: {
                                  "key": controller.alunos[i].key.toString()
                                }).then((value) => {controller.buscaAlunos()});
                              },
                              child: Icon(Icons.edit),
                              shape: CircleBorder(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ),
        ),
      ),
      floatingActionButton: RawMaterialButton(
        onPressed: () {
          Get.toNamed("/alunos-cadastro")
              .then((value) => {controller.buscaAlunos()});
        },
        fillColor: Get.theme.primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: CircleBorder(),
      ),
    );
  }
}

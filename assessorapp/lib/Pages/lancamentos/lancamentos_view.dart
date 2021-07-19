import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lancamentos_controller.dart';

class LancamentosView extends GetView<LancamentosController> {
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
                  itemCount: controller.lancamentos.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          controller.lancamentos[i].dataLancamento.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        tileColor: controller.lancamentos[i].iesAtivo
                            ? Colors.white
                            : Colors.grey,
                        trailing: Wrap(
                          children: <Widget>[
                            RawMaterialButton(
                              constraints: BoxConstraints(minWidth: 20),
                              onPressed: () {
                                controller.excluirLancamento(
                                    controller.lancamentos[i]);
                              },
                              child: Icon(Icons.close),
                              shape: CircleBorder(),
                            ),
                            RawMaterialButton(
                              constraints: BoxConstraints(minWidth: 20),
                              onPressed: () {
                                Get.toNamed("/alunos-cadastro", parameters: {
                                  "key":
                                      controller.lancamentos[i].key.toString()
                                }).then(
                                    (value) => {controller.buscaLancamentos()});
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
              .then((value) => {controller.buscaLancamentos()()});
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

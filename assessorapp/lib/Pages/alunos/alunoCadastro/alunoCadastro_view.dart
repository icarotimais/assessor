import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'alunoCadastro_controller.dart';

class AlunoCadastroView extends GetView<AlunoCadastroController> {
  @override
  Widget build(BuildContext context) {
    var alturaDevice = MediaQuery.of(context).size.height / 100;
    var larguraDevice = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              "Cadastro Aluno",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(children: [
                Obx(() => Container(
                      width: Get.width > 800 ? 300 : 400,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        initialValue: controller.nome.value,
                        onChanged: controller.setNome,
                        decoration: InputDecoration(
                            labelText: "Nome",
                            errorText: controller.nomeValidator,
                            isDense: true),
                      ),
                    )),
                Obx(() => Container(
                      width: Get.width > 800 ? 300 : 400,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        initialValue: controller.sobrenome.value,
                        onChanged: controller.setSobrenome,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Sobrenome",
                            errorText: controller.sobrenomeValidator,
                            isDense: true),
                      ),
                    )),
                Container(
                  width: Get.width > 800 ? 300 : 400,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Obx(() => CheckboxListTile(
                        title: Text("Ativo?"),
                        value: controller.iesAtivo.value,
                        onChanged: controller.setIesAtivo,
                        controlAffinity: ListTileControlAffinity.leading,
                      )),
                ),
                Container(
                  width: Get.width > 800 ? 300 : 400,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                    onPressed: controller.salvaAluno,
                    child: Text("Salvar"),
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    var alturaDevice = Get.size.height;
    var larguraDevice = Get.size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: alturaDevice * .2),
            child: Center(
              child: Image(
                  width: 500,
                  height: 85,
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/Logo.png')),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: alturaDevice * .1),
              width: larguraDevice * .3,
              height: alturaDevice * .3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    width: larguraDevice * .2,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Obx(
                      () => TextFormField(
                        keyboardType: TextInputType.text,
                        initialValue: controller.login.value,
                        onChanged: controller.setLogin,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            labelText: "Login",
                            labelStyle: TextStyle(color: Colors.black),
                            errorText: controller.msgLoginValidate,
                            isDense: true),
                      ),
                    ),
                  ),
                  Container(
                    width: larguraDevice * .2,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Obx(
                      () => TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        initialValue: controller.senha.value,
                        onChanged: controller.setSenha,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(color: Colors.black),
                            errorText: controller.msgSenhaValidate,
                            isDense: true),
                      ),
                    ),
                  ),
                  Container(
                    width: larguraDevice * .2,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Obx(
                      () => ElevatedButton(
                          onPressed: controller.formValidate
                              ? controller.entrar
                              : null,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                              )),
                          child: Text(
                            "Entrar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1,
                                decoration: TextDecoration.none),
                          )),
                    ),
                  ),
                ],
              )))
        ]),
      ),
    );
  }
}

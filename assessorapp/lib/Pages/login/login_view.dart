import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    var alturaDevice = MediaQuery.of(context).size.height / 100;
    var larguraDevice = MediaQuery.of(context).size.width / 100;

    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        Container(
          height: alturaDevice * 50,
          width: larguraDevice * 100,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
          ),
          child: Center(
            child:Image(
                width: 215.0,
                height: 111.0,
                fit: BoxFit.fill,
                image: new AssetImage('assets/images/Logo.png')),
          ),
        ),
        Container(
          height: alturaDevice * 50,
          width: larguraDevice * 100,
           decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                     width: MediaQuery.of(context).size.width/2.0,
                      color: Colors.white,
                      child: Obx(() => TextFormField(
                          keyboardType: TextInputType.text,
                          initialValue: controller.login.value,
                          onChanged: controller.setLogin,
                          style: TextStyle(
                              color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Login",
                              fillColor: Colors.white,
                              errorText: controller.msgLoginValidate,
                              isDense: true),
                        ),
                      ),
                    ),Container(
                      width: MediaQuery.of(context).size.width/2.0,
                      color: Colors.white,
                      child: Obx(() =>TextFormField(
                          keyboardType: TextInputType.text,
                          initialValue: controller.senha.value,
                          onChanged: controller.setSenha,
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Senha",
                              fillColor: Colors.white,
                              errorText: controller.msgSenhaValidate,
                              isDense: true),
                        ),
                      ),
                    ),
                  ButtonTheme(
                    minWidth: 115,
                    child: Obx(() => RaisedButton(
                          onPressed: controller.formValidate?controller.entrar:null,
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
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
                  )
                ],
              ),
        ),
      ]),
    ));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TCC | Carteira de Vacinação"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "img/vaccine.png",
                width: 100.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
              ),
              Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                    controller: mailController,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Campo Obrigatório.";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                    controller: passController,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Campo Obrigatório.";
                      }
                    },
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
              ),
              RaisedButton(
                child: Text(
                  "ENTRAR",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                onPressed: () {},
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              GestureDetector(
                  child: Text("Ainda não possui cadastro?",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.grey,
                          fontSize: 16.0)),
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

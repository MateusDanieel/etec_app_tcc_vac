import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tcc_cart_vac/views/cadastro.dart';
import 'package:tcc_cart_vac/views/dash.dart';
import 'package:tcc_cart_vac/models.dart';
import 'package:tcc_cart_vac/api.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var users = new List<User>();
  String _logError = "";

  _getUsers() {
    Usuarios.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login | Carteira de Vacinação"),
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
                    style: TextStyle(color: Colors.black, fontSize: 22.5),
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
                    style: TextStyle(color: Colors.black, fontSize: 22.5),
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
              Text("$_logError",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.redAccent,
                      fontSize: 18.0)),
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
                  onPressed: () {
                    users.forEach((el) {
                      if (el.email == mailController.text &&
                          el.senha == passController.text) {
                        String usuarioLogado;
                        setState(() {
                          _logError = "";
                          usuarioLogado = mailController.text;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dash(usuarioLogado)));
                        });
                      } else {
                        setState(() {
                          _logError = "Usuário e/ou senha inválida.";
                        });
                      }
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              GestureDetector(
                  child: Text("Ainda não possui cadastro?",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.grey,
                          fontSize: 16.0)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cadastro()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

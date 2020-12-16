import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'package:tcc_cart_vac/models.dart';
import 'package:tcc_cart_vac/api.dart';

import 'login.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  String _cadError = "";
  Dio dio = new Dio();
  Future postData() async {
    final String pathUrl = 'https://vacina-app.herokuapp.com/user';

    dynamic data = {
      'nomeCompleto': nomeCompController.text,
      'email': emailController.text,
      'senha': senhaController.text,
      'cpf': cpfController.text,
      'dataNasc': dtNascController.text,
      'susCartao': nmrSusController.text
    };
    var response = await dio.post(pathUrl,
        data: data,
        options: Options(headers: {
          'Content-type': 'application/json; charset=UTF-8',
        }));

    return response.data;
  }

  TextEditingController nomeCompController = TextEditingController();
  TextEditingController nmrSusController = TextEditingController();
  TextEditingController dtNascController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro | Carteira de Vacinação"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            Text(
              "Para liberar seu acesso ao sistema, preencha os campos a seguir:",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Nome Completo",
                labelStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(color: Colors.black, fontSize: 22.5),
              controller: nomeCompController,
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return "Campo Obrigatório.";
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Data de Nascimento",
                labelStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(color: Colors.black, fontSize: 22.5),
              controller: dtNascController,
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return "Campo Obrigatório.";
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "CPF",
                labelStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(color: Colors.black, fontSize: 22.5),
              controller: cpfController,
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return "Campo Obrigatório.";
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Cartão do SUS",
                labelStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(color: Colors.black, fontSize: 22.5),
              controller: nmrSusController,
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return "Campo Obrigatório.";
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "E-mail",
                labelStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(color: Colors.black, fontSize: 22.5),
              controller: emailController,
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
              controller: senhaController,
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return "Campo Obrigatório.";
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            ),
            Text("$_cadError",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.redAccent,
                    fontSize: 18.0)),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            ),
            RaisedButton(
              child: Text(
                "FINALIZAR",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              color: Colors.lightBlueAccent,
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              onPressed: () {
                if (nomeCompController.text == "" ||
                    nmrSusController.text == "" ||
                    dtNascController.text == "" ||
                    emailController.text == "" ||
                    senhaController.text == "") {
                  setState(() {
                    return _cadError = "Preencha todos os campos.";
                  });
                } else {
                  setState(() async {
                    print('posting data ...');
                    await postData().then((value) {
                      final String nomeCompleto = nomeCompController.text;
                      final String susCartao = nmrSusController.text;
                      final String dataNasc = dtNascController.text;
                      final String email = emailController.text;
                      final String senha = senhaController.text;
                      _cadError = "";
                      print(value);
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  });
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController nomeCompController = TextEditingController();
  TextEditingController nmrSusController = TextEditingController();
  TextEditingController dtNascController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController cepController = TextEditingController();
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
                labelText: "CEP",
                labelStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(color: Colors.black, fontSize: 22.5),
              controller: cepController,
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
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            ),
            RaisedButton(
              child: Text(
                "FINALIZAR",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              color: Colors.lightBlueAccent,
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              onPressed: () {},
            ),
          ]),
        ),
      ),
    );
  }
}

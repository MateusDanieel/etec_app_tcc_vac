import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tcc_cart_vac/api.dart';
import 'package:tcc_cart_vac/models.dart';

class Dash extends StatefulWidget {
  String usuarioLogado;

  Dash(this.usuarioLogado);

  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  var vacinados = new List<Vacinado>();
  var vacinas = new List<Vacina>();

  _getVacinados() {
    Vacinados.getVacinados().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        vacinados = list.map((model) => Vacinado.fromJson(model)).toList();
      });
    });
  }

  _getVacinas() {
    Vacinas.getVacinas().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        vacinas = list.map((model) => Vacina.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getVacinados();
    _getVacinas();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Início | Carteira de Vacinação"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: vacinas.length,
          itemBuilder: (context, index) {
            return _listaVacinas(context, index);
          }),
    );
  }

  Widget _listaVacinas(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              ListTile(
                title: Text(vacinas[index].nomeVacina.toUpperCase(),
                    style: TextStyle()),
                subtitle: Text(
                  widget.usuarioLogado == vacinados[index].emailUsuario &&
                          vacinados[index].statusVacinaAplicada == true
                      ? ("DATA: " +
                              vacinados[index].dataVacinaAplicada +
                              " | LOTE: " +
                              vacinados[index].lote)
                          .toUpperCase()
                      : ("PENDENTE"),
                ),
              ),
            ])),
      ),
    );
  }
}

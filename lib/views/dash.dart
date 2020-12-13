import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Início | Carteira de Vacinação"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(children: [
            ListTile(
              title: Text("POLIOMIELITE", style: TextStyle()),
              subtitle: Text("DATA: 22/08/1997 | LOTE: 37.038-SP"),
            ),
            ListTile(
              title: Text("HEPATITE B", style: TextStyle()),
              subtitle: Text(
                "PENDENTE",
                style: TextStyle(color: Colors.red),
              ),
            ),
            ListTile(
              title: Text("SARAMPO", style: TextStyle()),
              subtitle: Text(
                "PENDENTE",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ])),
    );
  }
}

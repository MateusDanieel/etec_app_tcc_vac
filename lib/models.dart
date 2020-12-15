class User {
  int id;
  String nome;
  String email;
  String senha;
  String cpf;
  String dtNasc;
  String susCartao;

  User(int id, String nome, String email, String senha, String cpf,
      String dtNasc, String susCartao) {
    this.id = id;
    this.nome = nome;
    this.email = email;
    this.senha = senha;
    this.cpf = cpf;
    this.dtNasc = dtNasc;
    this.susCartao = susCartao;
  }
  User.fromJson(Map json)
      : id = json['id'],
        nome = json['nomeCompleto'],
        email = json['email'],
        senha = json['senha'],
        cpf = json['cpf'],
        dtNasc = json['dataNasc'],
        susCartao = json['susCartao'];
  Map toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'senha': senha,
      'cpf': cpf,
      'dtNasc': dtNasc,
      'susCartao': susCartao
    };
  }
}

class Vacina {
  int id;
  String nomeVacina;
  String loteVacina;
  String codigoVacina;

  Vacina({this.id, this.nomeVacina, this.loteVacina, this.codigoVacina});

  Vacina.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeVacina = json['nomeVacina'];
    loteVacina = json['loteVacina'];
    codigoVacina = json['codigoVacina'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomeVacina'] = this.nomeVacina;
    data['loteVacina'] = this.loteVacina;
    data['codigoVacina'] = this.codigoVacina;
    return data;
  }
}

class Vacinado {
  int id;
  String nomeVacina;
  String dataVacinaAplicada;
  String lote;
  String nomeEnfermagem;
  String nomePostoSaude;
  bool statusVacinaAplicada;
  String codigoVacina;
  String emailUsuario;

  Vacinado(
      {this.id,
      this.nomeVacina,
      this.dataVacinaAplicada,
      this.lote,
      this.nomeEnfermagem,
      this.nomePostoSaude,
      this.statusVacinaAplicada,
      this.codigoVacina,
      this.emailUsuario});

  Vacinado.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeVacina = json['nomeVacina'];
    dataVacinaAplicada = json['dataVacinaAplicada'];
    lote = json['lote'];
    nomeEnfermagem = json['nomeEnfermagem'];
    nomePostoSaude = json['nomePostoSaude'];
    statusVacinaAplicada = json['statusVacinaAplicada'];
    codigoVacina = json['codigoVacina'];
    emailUsuario = json['emailUsuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomeVacina'] = this.nomeVacina;
    data['dataVacinaAplicada'] = this.dataVacinaAplicada;
    data['lote'] = this.lote;
    data['nomeEnfermagem'] = this.nomeEnfermagem;
    data['nomePostoSaude'] = this.nomePostoSaude;
    data['statusVacinaAplicada'] = this.statusVacinaAplicada;
    data['codigoVacina'] = this.codigoVacina;
    data['emailUsuario'] = this.emailUsuario;
    return data;
  }
}

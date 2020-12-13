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

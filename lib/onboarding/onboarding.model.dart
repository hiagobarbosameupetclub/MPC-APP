import 'dart:convert';

class Cadastro {
  String idCliente = "65117d4752c5a58e888be2ba";
  String nome;
  String email;
  String cpf;
  String senha;

  Cadastro(this.idCliente, this.nome, this.email, this.cpf, this.senha);
  Cadastro.nova(this.nome, this.email, this.cpf, this.senha);

  Map<String, dynamic> toMap() {
    return {
      'idCliente': this.idCliente,
      'nome': this.nome,
      'email': this.email,
      'cpf': this.cpf,
      'senha': this.senha
    };
  }

  static Cadastro fromMap(Map<String, dynamic> map) {
    return Cadastro(
        map['idCliente'], map['nome'], map['email'], map['cpf'], map['senha']);
    // return Cadastro(
    //     map['idCliente'], map['nome'], map['email'], map['cpf'], map['senha']);
  }

  static List<Cadastro> fromMaps(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return Cadastro.fromMap(maps[i]);
    });
  }

  static Cadastro fromJson(String j) => Cadastro.fromMap(jsonDecode(j));
  static List<Cadastro> fromJsonList(String j) {
    final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
    return parsed.map<Cadastro>((map) => Cadastro.fromMap(map)).toList();
  }

  String toJson() => jsonEncode(toMap());
}

import 'dart:convert';

class Cliente {
  num? id;
  String nome;
  String sobrenome;
  String cpf;

  Cliente(this.id, this.nome, this.sobrenome, this.cpf);
  Cliente.novo(this.nome, this.sobrenome, this.cpf);

  static Cliente fromMap(Map<String, dynamic> map) {
    return Cliente(map['idCliente'], map['nome'], map['sobrenome'], map['cpf']);
  }

  static List<Cliente> fromMaps(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return Cliente.fromMap(maps[i]);
    });
  }

  Map<String, dynamic> toMap() {
    return {'idCliente': id, 'nome': nome, 'sobrenome': sobrenome, 'cpf': cpf};
  }

  static Cliente fromJson(String j) => Cliente.fromMap(jsonDecode(j));

  static List<Cliente> fromJsonList(String j) {
    final utf8Json = utf8.decode(j.codeUnits);
    final parsed = jsonDecode(utf8Json).cast<Map<String, dynamic>>();
    return parsed.map<Cliente>((map) => Cliente.fromMap(map)).toList();
  }

  String toJson() => jsonEncode(toMap());
  
}

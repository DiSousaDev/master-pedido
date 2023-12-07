import 'dart:convert';

class Produto {
  num? id;
  String descricao;

  Produto(this.id, this.descricao);
  Produto.novo(this.descricao);

  static Produto fromMap(Map<String, dynamic> map) {
    return Produto(map['id'], map['descricao']);
  }

  static List<Produto> fromMaps(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return Produto.fromMap(maps[i]);
    });
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'descricao': descricao};
  }

  static Produto fromJson(String j) => Produto.fromMap(jsonDecode(j));

  static List<Produto> fromJsonList(String j) {
    final utf8Json = utf8.decode(j.codeUnits);
    final parsed = jsonDecode(utf8Json).cast<Map<String, dynamic>>();
    return parsed.map<Produto>((map) => Produto.fromMap(map)).toList();
  }

  String toJson() => jsonEncode(toMap());
}

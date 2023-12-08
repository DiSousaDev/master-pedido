import 'dart:convert';

class ProdutoPedido {
  final num? id;
  final String descricao;

  ProdutoPedido(this.id, this.descricao);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
    };
  }

  String toJson() => jsonEncode(toMap());

}
class ProdutoPedido {
  final num? id;
  final String descricao;

  ProdutoPedido(this.id, this.descricao);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
    };
  }
}
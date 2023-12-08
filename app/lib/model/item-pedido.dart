import 'package:app/model/produto-pedido.dart';

import 'dart:convert';

class ItemPedido {
  final int quantidade;
  final ProdutoPedido produto;

  ItemPedido(this.quantidade, this.produto);

  Map<String, dynamic> toMap() {
    return {
      'quantidade': quantidade,
      'produto': produto.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());

}

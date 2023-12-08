import 'item-pedido.dart';

import 'dart:convert';

class PedidoRequest {
  final String cpf;
  final List<ItemPedido> itens;

  PedidoRequest(this.cpf, this.itens);

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'itens': itens.map((item) => item.toMap()).toList(),
    };
  }

  String toJson() => jsonEncode(toMap());

}
import 'item-pedido.dart';

class PedidoRequest {
  final String cpf;
  final List<ItemPedido> itens;

  PedidoRequest(this.cpf, this.itens);

  Map<String, dynamic> toJson() {
    return {
      'cpf': cpf,
      'itens': itens.map((item) => item.toJson()).toList(),
    };
  }
}
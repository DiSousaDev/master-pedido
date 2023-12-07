import 'package:app/model/produto-pedido.dart';

class ItemPedido {
  final int quantidade;
  final ProdutoPedido produto;

  ItemPedido(this.quantidade, this.produto);

  Map<String, dynamic> toJson() {
    return {
      'quantidade': quantidade,
      'produto': produto.toJson(),
    };
  }
}

import 'package:app/model/pedido-request.dart';
import 'package:app/model/pedido-response.dart';
import 'package:app/model/pedido.dart';
import 'package:app/model/produto.dart';
import 'package:app/service/produto_rest.dart';

class ProdutoRepository {
  final PedidoRest api = PedidoRest();

  // Future<Produto> buscar(int id) async {
  //   return await api.buscar(id);
  // }
  //
  // Future<List<Produto>> buscarTodos() async {
  //   return await api.buscarTodos();
  // }

  Future<PedidoResponse> inserir(PedidoRequest pedidoRequest) async {
    return await api.inserir(produto);
  }

  // Future<Produto> alterar(Produto produto) async {
  //   return await api.alterar(produto);
  // }
  //
  // Future<void> remover(num id) async {
  //   return await api.remover(id);
  // }
}

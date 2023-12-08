import 'package:app/model/pedido-request.dart';
import 'package:app/model/pedido-response.dart';

import '../service/pedido_rest.dart';

class PedidoRepository {
  final PedidoRest api = PedidoRest();

  Future<PedidoResponse> inserir(PedidoRequest pedidoRequest) async {
    return await api.inserir(pedidoRequest);
  }

}

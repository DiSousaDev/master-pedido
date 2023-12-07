import 'package:app/model/cliente.dart';

class PedidoResponse {
  final num idPedido;
  final String data;
  final Cliente cliente;

  PedidoResponse(this.idPedido, this.data, this.cliente);

  Map<String, dynamic> toJson() {
    return {
      'idPedido': idPedido,
      'data': data,
      'cliente': cliente.toJson(),
    };
  }
}
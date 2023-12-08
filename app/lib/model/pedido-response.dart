import 'dart:convert';

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

  static PedidoResponse fromMap(Map<String, dynamic> map) {
    return PedidoResponse(
        map['idPedido'],
        map['data'],
        Cliente.fromMap(map['cliente'])
    );
  }

  static List<PedidoResponse> fromMaps(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return PedidoResponse.fromMap(maps[i]);
    });
  }

  static PedidoResponse fromJson(String j) => PedidoResponse.fromMap(jsonDecode(j));

}
import 'dart:async';

import 'package:app/model/pedido-request.dart';
import 'package:app/model/pedido-response.dart';
import 'package:app/service/api.dart';
import 'package:http/http.dart' as http;

class PedidoRest {
  Future<PedidoResponse> inserir(PedidoRequest pedido) async {
    final http.Response response =
        await http.post(Uri.http(API.endpoint, '/pedidos'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: pedido.toJson());
    if (response.statusCode == 201) {
      return PedidoResponse.fromJson(response.body);
    } else {
      throw Exception('Erro ao inserir pedido.');
    }
  }
}

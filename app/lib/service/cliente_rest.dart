import 'dart:async';

import 'package:app/service/api.dart';
import 'package:http/http.dart' as http;

import '../model/cliente.dart';

class ClienteRest {

  Future<List<Cliente>> buscarTodos() async {
    final http.Response response =
        await http.get(Uri.http(API.endpoint, "clientes/all"));
    if (response.statusCode == 200) {
      return Cliente.fromJsonList(response.body);
    } else {
      throw Exception('Erro ao buscar todos os clientes.');
    }
  }

  Future<Cliente> inserir(Cliente cliente) async {
    final http.Response response =
    await http.post(Uri.http(API.endpoint, 'clientes'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: cliente.toJson());
    if (response.statusCode == 201) {
      return Cliente.fromJson(response.body);
    } else {
      throw Exception('Erro ao inserir cliente.');
    }
  }

  Future<Cliente> alterar(Cliente cliente) async {
    final http.Response response = await http.put(
      Uri.http(API.endpoint, 'clientes/${cliente.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: cliente.toJson(),
    );
    if (response.statusCode == 200) {
      return cliente;
    } else {
      throw Exception('Erro alterando cliente ${cliente.id}.');
    }
  }

  Future<void> remover(num id) async {
    final http.Response response = await http.delete(
        Uri.http(API.endpoint, '/clientes/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 204) {
      return;
    } else {
      throw Exception('Erro ao remover cliente: [$id].');
    }
  }

}

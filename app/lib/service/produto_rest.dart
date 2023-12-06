import 'dart:async';
import 'package:app/service/api.dart';
import 'package:http/http.dart' as http;

import 'package:app/model/produto.dart';

class ProdutoRest {
  Future<Produto> buscar(int id) async {
    final http.Response response =
        await http.get(Uri.http(API.endpoint, 'produtos/$id'));
    if (response.statusCode == 200) {
      return Produto.fromJson(response.body);
    } else {
      throw Exception(
          'Erro ao buscar produto: ${id} [code: ${response.statusCode}]');
    }
  }

  Future<List<Produto>> buscarTodos() async {
    final http.Response response =
        await http.get(Uri.http(API.endpoint, "produtos/all"));
    if (response.statusCode == 200) {
      return Produto.fromJsonList(response.body);
    } else {
      throw Exception('Erro ao buscar todos os produtos.');
    }
  }

  Future<Produto> inserir(Produto produto) async {
    final http.Response response =
        await http.post(Uri.http(API.endpoint, 'produtos'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: produto.toJson());
    if (response.statusCode == 201) {
      return Produto.fromJson(response.body);
    } else {
      throw Exception('Erro ao inserir produto.');
    }
  }

  Future<Produto> alterar(Produto produto) async {
    final http.Response response = await http.put(
      Uri.http(API.endpoint, 'produtos/${produto.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: produto.toJson(),
    );
    if (response.statusCode == 200) {
      return produto;
    } else {
      throw Exception('Erro alterando produto ${produto.id}.');
    }
  }

  Future<Produto> remover(int id) async {
    final http.Response response = await http.delete(
        Uri.http(API.endpoint, '/produtos/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      return Produto.fromJson(response.body);
    } else {
      throw Exception('Erro ao remover produto: [$id].');
    }
  }
}

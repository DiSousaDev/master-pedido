import '../model/cliente.dart';
import '../service/cliente_rest.dart';

class ClienteRepository {
  final ClienteRest api = ClienteRest();

  Future<List<Cliente>> buscarTodos() async {
    return await api.buscarTodos();
  }

  Future<Cliente> inserir(Cliente cliente) async {
    return await api.inserir(cliente);
  }

  Future<Cliente> alterar(Cliente cliente) async {
    return await api.alterar(cliente);
  }

  Future<void> remover(num id) async {
    return await api.remover(id);
  }
}

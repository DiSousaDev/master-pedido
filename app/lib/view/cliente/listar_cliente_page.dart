import 'package:flutter/material.dart';
import 'package:app/model/cliente.dart';
import 'package:app/routes/routes.dart';
import 'package:app/view/cliente/editar_cliente_page.dart';
import 'package:app/widgets/index.dart';

import '../../repository/cliente_repository.dart';
import '../../service/error/error.dart';

class ListarClientePage extends StatefulWidget {
  static const String routeName = '/list';

  ListarClientePage({super.key});
  @override
  State<StatefulWidget> createState() => _ListarClientePageState();
}

class _ListarClientePageState extends State<ListarClientePage> {
  List<Cliente> _lista = <Cliente>[];
  List<Cliente> _searchResult = <Cliente>[];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  void _refreshList() async {
    List<Cliente> tempList = await _obterTodos();

    // Se o campo de pesquisa não estiver vazio, filtra os resultados
    if (_searchController.text.isNotEmpty) {
      _searchResult = tempList.where((cliente) {
        return cliente.cpf
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
      }).toList();
    } else {
      _searchResult = tempList;
    }

    setState(() {
      _lista = tempList;
    });
  }

  Future<List<Cliente>> _obterTodos() async {
    List<Cliente> tempLista = <Cliente>[];
    try {
      ClienteRepository repository = ClienteRepository();
      tempLista = await repository.buscarTodos();
    } catch (exception) {
      showError(context, "Erro obtendo lista de clientes", exception.toString());
    }
    return tempLista;
  }

  void _removerCliente(num id) {
    try {
      ClienteRepository repository = ClienteRepository();
      repository.remover(id).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cliente removido com sucesso!')),
        );
        _refreshList();
      }).catchError((error) {
        showError(context, 'Erro ao remover o cliente', error.toString());
      });
    } catch (exception) {
      showError(context, 'Erro ao remover o cliente', exception.toString());
    }
  }

  void _editItem(BuildContext context, int index) {
    Cliente cliente = _lista[index];
    Navigator.pushNamed(
      context,
      EditarClientePage.routeName,
      arguments: {
        "id": cliente.id!,
        "nome": cliente.nome,
        "sobrenome": cliente.sobrenome,
        "cpf": cliente.cpf,
      },
    ).then((_) {
      _refreshList();
    });
  }

  void _removeItem(BuildContext context, int index) {
    Cliente cliente = _lista[index];
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Remover Cliente"),
        content: Text("Gostaria realmente de remover ${cliente.nome}?"),
        actions: [
          TextButton(
            child: Text("Sim"),
            onPressed: () {
              _removerCliente(cliente.id!);
              _refreshList();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Não"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  ListTile _buildItem(BuildContext context, int index) {
    Cliente cliente = _lista[index];
    return ListTile(
      leading: Icon(Icons.people),
      title: Text(cliente.nome + ' ' + cliente.sobrenome),
      subtitle: Text(cliente.cpf),
      trailing: PopupMenuButton(
        itemBuilder: (context) {
          return [
            PopupMenuItem(value: 'edit', child: Text('Editar')),
            PopupMenuItem(value: 'delete', child: Text('Remover')),
          ];
        },
        onSelected: (String value) {
          if (value == 'edit')
            _editItem(context, index);
          else
            _removeItem(context, index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Digite o CPF do cliente',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (text) {
            _refreshList();
          },
        ),
      ),
      drawer: AppDrawer(),
      body: _searchResult.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (context, index) {
                      return _buildItem(context, index);
                    },
                  ),
                ),
              ],
            )
          : Container(
              child: Center(
                child: Text("Nenhum resultado encontrado"),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.insertCliente);
        },
        tooltip: 'Adicionar novo cliente',
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

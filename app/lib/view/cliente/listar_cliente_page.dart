import 'package:flutter/material.dart';
import 'package:app/model/cliente.dart';
import 'package:app/view/cliente/editar_cliente_page.dart';
import 'package:app/widgets/drawer.dart';

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
        return cliente.nome
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
    // Simulando dados do banco de dados
    return <Cliente>[
      Cliente(1, "Geraldo", "Silva", '813095713807'),
      Cliente(2, "Gustavo", "Costa", '928492460924'),
      Cliente(3, "Milene", "Oliveira", '9284935901953'),
    ];
  }

  void _removerCliente(int id) {
    // Implementar a lógica de remoção do cliente
  }

  void _showItem(BuildContext context, int index) {
    Cliente cliente = _lista[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(cliente.nome),
          content: Column(
            children: [
              Text("Nome: ${cliente.nome}"),
              Text("Sobrenome: ${cliente.sobrenome}"),
              Text("CPF: ${cliente.cpf}"),
            ],
          ),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha a dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _editItem(BuildContext context, int index) {
    Cliente cliente = _lista[index];
    Navigator.pushNamed(
      context,
      EditarClientePage.routeName,
      arguments: <String, int>{"id": cliente.id!},
    );
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
            child: Text("Não"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Sim"),
            onPressed: () {
              _removerCliente(cliente.id!);
              _refreshList();
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
      title: Text(cliente.nome),
      subtitle: Text(cliente.sobrenome),
      onTap: () {
        _showItem(context, index);
      },
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
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Pesquisar...',
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
                child: Text("Nenhum resultado encontrado."),
              ),
            ),
    );
  }
}

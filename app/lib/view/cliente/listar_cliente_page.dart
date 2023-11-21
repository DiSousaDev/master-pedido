import 'package:app/model/cliente.dart';
import 'package:app/view/cliente/editar_cliente_page.dart';

import 'package:app/widgets/drawer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListarClientePage extends StatefulWidget {
  static const String routeName = '/list';

  ListarClientePage({super.key});
  @override
  State<StatefulWidget> createState() => _ListarClientePageState();
}

class _ListarClientePageState extends State<ListarClientePage> {
  List<Cliente> _lista = <Cliente>[];

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _refreshList() async {
    List<Cliente> tempList = await _obterTodos();
    setState(() {
      _lista = tempList;
    });
  }

  Future<List<Cliente>> _obterTodos() async {
    // Banco de Dados Buscar as Informações
    return <Cliente>[
      Cliente(1, "Cliente 1", "Geraldo", '813095713807'),
      Cliente(2, "Cliente 2", "Gustavo", '928492460924'),
      Cliente(3, "Cliente 3", "Milene", '9284935901953'),
    ];
  }

  void _removerCliente(int id) async {
    // dado um cliente remove o boi da base
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
                Navigator.of(context).pop(); // fecha a dialog
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
            ));
  }

  ListTile _buildItem(BuildContext context, int index) {
    Cliente cliente = _lista[index];
    return ListTile(
      leading: Icon(Icons.people),
      title: Text(cliente.nome),
      subtitle: Text(cliente.sobrenome),
      onTap: () {
        _showItem(context, index);
      }, // Adicione a vírgula aqui
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
      ), // PopupMenuButton
    ); // ListTile
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Listagem de Clientes"),
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
          itemCount: _lista.length,
          itemBuilder: _buildItem,
        ));
  }
}

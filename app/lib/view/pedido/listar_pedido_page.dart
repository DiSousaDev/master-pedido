import 'package:flutter/material.dart';
import 'package:app/model/pedido.dart';
import 'package:app/routes/routes.dart';
import 'package:app/widgets/index.dart';

class ListarPedidoPage extends StatefulWidget {
  static const String routeName = '/pedido/list';

  ListarPedidoPage({super.key});
  @override
  State<StatefulWidget> createState() => _ListarPedidoPageState();
}

class _ListarPedidoPageState extends State<ListarPedidoPage> {
  List<Pedido> _lista = <Pedido>[];
  List<Pedido> _searchResult = <Pedido>[];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  void _refreshList() async {
    List<Pedido> tempList = await _obterTodos();

    // Se o campo de pesquisa não estiver vazio, filtra os resultados
    if (_searchController.text.isNotEmpty) {
      _searchResult = tempList.where((pedido) {
        return pedido.cpf
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

  Future<List<Pedido>> _obterTodos() async {
    // Simulando dados do banco de dados
    return <Pedido>[
      Pedido(1, "813095713807", 1, ['Caneta preta']),
      Pedido(2, "913045713807", 1, ['Lápis de cor 32 cores']),
      Pedido(3, "833095714807", 1, ['Caneta vermelha', 'Papel A4']),
    ];
  }

  void _removerPedido(int id) {
    // Implementar a lógica de remoção do pedido
  }

  void _showItem(BuildContext context, int index) {
    Pedido pedido = _lista[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(pedido.itens as String),
          content: Column(
            children: [
              Text("CPF: ${pedido.cpf}"),
              Text("Quantidade: ${pedido.quantidade}"),
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

  void _removeItem(BuildContext context, int index) {
    Pedido pedido = _lista[index];
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Remover Pedido"),
        content: Text("Gostaria realmente de remover ${pedido.id}?"),
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
              _removerPedido(pedido.id!);
              _refreshList();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  ListTile _buildItem(BuildContext context, int index) {
    Pedido pedido = _lista[index];
    return ListTile(
      leading: Icon(Icons.assignment),
      title: Text(pedido.cpf),
      subtitle: Text(pedido.itens.map((item) => item.toString()).join(', ')),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.insertPedido);
        },
        tooltip: 'Adicionar pedido',
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

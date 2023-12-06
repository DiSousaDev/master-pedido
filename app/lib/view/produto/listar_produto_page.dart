import 'package:app/view/produto/editar_produto_page.dart';
import 'package:flutter/material.dart';
import 'package:app/model/produto.dart';
import 'package:app/routes/routes.dart';
import 'package:app/widgets/index.dart';

class ListarProdutoPage extends StatefulWidget {
  static const String routeName = '/produto/list';

  ListarProdutoPage({super.key});
  @override
  State<StatefulWidget> createState() => _ListarProdutoPageState();
}

class _ListarProdutoPageState extends State<ListarProdutoPage> {
  List<Produto> _lista = <Produto>[];
  List<Produto> _searchResult = <Produto>[];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  void _refreshList() async {
    List<Produto> tempList = await _obterTodos();

    // Se o campo de pesquisa não estiver vazio, filtra os resultados
    if (_searchController.text.isNotEmpty) {
      _searchResult = tempList.where((produto) {
        return produto.descricao
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

  Future<List<Produto>> _obterTodos() async {
    // Simulando dados do banco de dados
    return <Produto>[
      Produto(1, "Lápis 2B"),
      Produto(2, "Papel A4"),
      Produto(3, "Caneta BIC Preta")
    ];
  }

  void _removerProduto(int id) {
    // Implementar a lógica de remoção do cliente
  }

  void _showItem(BuildContext context, int index) {
    Produto produto = _lista[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(produto.descricao),
          content: Column(
            children: [
              Text("Produto: ${produto.descricao}"),
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
    Produto produto = _lista[index];
    Navigator.pushNamed(
      context,
      EditarProdutoPage.routeName,
      arguments: <String, int>{"id": produto.id!},
    );
  }

  void _removeItem(BuildContext context, int index) {
    Produto produto = _lista[index];
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Remover produto"),
        content: Text("Gostaria realmente de remover ${produto.descricao}?"),
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
              _removerProduto(produto.id!);
              _refreshList();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  ListTile _buildItem(BuildContext context, int index) {
    Produto produto = _lista[index];
    return ListTile(
      leading: Icon(Icons.shopping_bag),
      title: Text(produto.descricao),
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
        backgroundColor: Colors.teal,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Pesquisar produto',
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
          Navigator.pushReplacementNamed(context, Routes.insertProduto);
        },
        tooltip: 'Adicionar produto',
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

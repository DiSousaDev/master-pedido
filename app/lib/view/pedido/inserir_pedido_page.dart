import 'package:app/model/pedido-request.dart';
import 'package:app/model/produto.dart';
import 'package:app/repository/produto_repository.dart';
import 'package:flutter/material.dart';

import '../../model/item-pedido.dart';
import '../../model/produto-pedido.dart';
import '../../repository/pedido_repository.dart';
import '../../widgets/bottom_navigation_bar.dart';
import '../../widgets/drawer.dart';

class InserirPedidoPage extends StatefulWidget {
  static const String routeName = '/pedido/insert';

  @override
  _InserirPedidoState createState() => _InserirPedidoState();
}

class _InserirPedidoState extends State<InserirPedidoPage> {
  final _formKey = GlobalKey<FormState>();
  List<Produto> listaDeProdutos = [];
  Produto? _produtoSelecionado;
  final _cpfController = TextEditingController();
  final _quantidadeController = TextEditingController();
  List<ItemPedido> listaItens = [];

  final ProdutoRepository produtoRepository = ProdutoRepository();

  @override
  void initState() {
    super.initState();
    carregarProdutos();
  }

  Future<void> carregarProdutos() async {
    try {
      final produtos = await produtoRepository.buscarTodos();
      setState(() {
        listaDeProdutos = produtos;
      });
    } catch (exception) {
      print('Erro ao carregar produtos: $exception');
    }
  }

  void _adicionarItem() {
    if (_produtoSelecionado != null && _quantidadeController.text.isNotEmpty) {
      final item = ItemPedido(
        int.parse(_quantidadeController.text),
        ProdutoPedido(
          _produtoSelecionado!.id,
          _produtoSelecionado!.descricao,
        ),
      );
      setState(() {
        listaItens.add(item);
        _produtoSelecionado = null;
        _quantidadeController.clear();
      });
    }
  }

  void _salvarPedido() async {
    if (_formKey.currentState!.validate()) {
      final novoPedido = PedidoRequest(_cpfController.text, listaItens);
      print(novoPedido.toJson());
      try {
        PedidoRepository repository = PedidoRepository();
        final pedidoInserido = await repository.inserir(novoPedido);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Pedido salvo com sucesso! ID: ${pedidoInserido.idPedido}'),
        ));
        Navigator.pushReplacementNamed(context, '/pedido/list');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Erro ao salvar o pedido: $e'),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _cpfController,
            decoration: InputDecoration(labelText: 'CPF'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo não pode ser vazio';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            child: DropdownButtonFormField<Produto>(
              isExpanded: true,
              value: _produtoSelecionado,
              items: listaDeProdutos.map((produto) {
                return DropdownMenuItem<Produto>(
                  value: produto,
                  child: Text(produto.descricao),
                );
              }).toList(),
              onChanged: (Produto? produto) {
                setState(() {
                  _produtoSelecionado = produto;
                });
              },
              decoration: InputDecoration(labelText: 'Selecionar Produto'),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
              controller: _quantidadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantidade')
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _adicionarItem,
            child: Text('Adicionar'),
          ),
          SizedBox(height: 16),
          Text(
            'Itens do Pedido:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            itemCount: listaItens.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  '${listaItens[index].produto.descricao} - ${listaItens[index]
                      .quantidade}',
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Inserir Pedido'),
      ),
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: _buildForm(context),
            ),
          ),
          // Adicionando o BottomNavigationBarWidget()
          BottomAppBar(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _salvarPedido,
                    child: Text('Salvar Pedido'),
                  ),
                ],
              ),
            ),
          ),
          BottomNavigationBarWidget()
        ],
      ),
    );
  }
}
import 'package:app/repository/produto_repository.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/index.dart';

import '../../model/produto.dart';

class InserirProdutoPage extends StatefulWidget {
  static const String routeName = '/produto/insert';

  @override
  _InserirProdutoState createState() => _InserirProdutoState();
}

class _InserirProdutoState extends State<InserirProdutoPage> {
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();

  @override
  void dispose() {
    _descricaoController.dispose();
    super.dispose();
  }

  void _salvar() async {
    if (_formKey.currentState!.validate()) {
      final descricao = _descricaoController.text;
      final novoProduto = Produto.novo(descricao);

      try {
        ProdutoRepository repository = ProdutoRepository();
        final produtoInserido = await repository.inserir(novoProduto);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Produto salvo com sucesso! ID: ${produtoInserido.id}'),
        ));
        Navigator.pushReplacementNamed(context, '/produto/list');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Erro ao salvar o produto: $e'),
          backgroundColor: Colors.red,
        ));
      }
      _descricaoController.clear();
    }
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Descrição
          TextFormField(
            controller: _descricaoController,
            decoration: InputDecoration(labelText: 'Nome do produto'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo não pode ser vazio';
              }
              return null;
            },
          ),

          // Espaçamento entre os campos
          SizedBox(height: 16),

          // Botão Salvar
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _salvar();
              }
            },
            child: Text('Salvar'),
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
        title: Text("Novo produto"),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildForm(context),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

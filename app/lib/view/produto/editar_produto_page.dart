import 'package:flutter/material.dart';
import 'package:app/widgets/index.dart';

import '../../model/produto.dart';
import '../../repository/produto_repository.dart';
import '../../service/error/error.dart';

class EditarProdutoPage extends StatefulWidget {
  static const String routeName = '/produto/edit';

  @override
  _EditarProdutoState createState() => _EditarProdutoState();
}

class _EditarProdutoState extends State<EditarProdutoPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _descricaoController;

  num? productId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    productId = args['id'] as num?;
  }

  @override
  void initState() {
    super.initState();
    _descricaoController = TextEditingController();
  }

  @override
  void dispose() {
    _descricaoController.dispose();
    super.dispose();
  }

  void _salvar() async {
    if (_formKey.currentState!.validate()) {
      String novoNome = _descricaoController.text;

      Produto produtoEditado = Produto(productId, novoNome);

      try {
        ProdutoRepository repository = ProdutoRepository();
        await repository.alterar(produtoEditado);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Produto editado com sucesso!')),
        );
        Navigator.popUntil(context, ModalRoute.withName('/produto/list'));
      } catch (error) {
        showError(context, 'Erro ao editar o produto', error.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String nomeProduto = args['nome'] as String;

    _descricaoController.text = nomeProduto;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Editar produto"),
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
          SizedBox(height: 16),
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
}
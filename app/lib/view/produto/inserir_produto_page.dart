import 'package:flutter/material.dart';
import 'package:app/widgets/index.dart';

class InserirProdutoPage extends StatefulWidget {
  static const String routeName = '/produto/insert';

  @override
  _InserirProdutoState createState() => _InserirProdutoState();
}

class _InserirProdutoState extends State<InserirProdutoPage> {
  final _formKey = GlobalKey<FormState>();
  final _descrisaoController = TextEditingController();

  @override
  void dispose() {
    _descrisaoController.dispose();
    super.dispose();
  }

  void _salvar() async {
    // Banco de Dados para Inserir um Produto
    // Nada aqui por enquanto
    _descrisaoController.clear();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Produto salvo com sucesso.')));
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Descrição
          TextFormField(
            controller: _descrisaoController,
            decoration: InputDecoration(labelText: 'Descrição'),
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
        title: Text("Inserir produto"),
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

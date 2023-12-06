import 'package:flutter/material.dart';
import 'package:app/widgets/index.dart';

class EditarProdutoPage extends StatefulWidget {
  static const String routeName = '/produto/edit';

  @override
  _EditarProdutoState createState() => _EditarProdutoState();
}

class _EditarProdutoState extends State<EditarProdutoPage> {
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();

  @override
  void dispose() {
    _descricaoController.dispose();
    super.dispose();
  }

  void _salvar() async {
    // Banco de Dados para Editar um Cliente
    // Nada aqui por enquanto
    _descricaoController.clear();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Produto editado com sucesso!')));
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
}

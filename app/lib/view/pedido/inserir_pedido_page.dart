import 'package:app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class InserirPedidoPage extends StatefulWidget {
  static const String routeName = '/pedido/insert';

  @override
  _InserirPedidoState createState() => _InserirPedidoState();
}

class _InserirPedidoState extends State<InserirPedidoPage> {
  final _formKey = GlobalKey<FormState>();
  final _cpfController = TextEditingController();
  final _quantidadeController = TextEditingController();
  final _itensController = TextEditingController();

  @override
  void dispose() {
    _cpfController.dispose();
    _quantidadeController.dispose();
    _itensController.dispose();
    super.dispose();
  }

  void _salvar() async {
    // Banco de Dados para Inserir um Produto
    // Nada aqui por enquanto
    _cpfController.clear();
    _quantidadeController.clear();
    _itensController.clear();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Pedido salvo com sucesso.')));
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Nome
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

          // Espaçamento entre os campos
          SizedBox(height: 16),

          // Sobrenome
          TextFormField(
            controller: _itensController,
            decoration: InputDecoration(labelText: 'Produto'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo não pode ser vazio';
              }
              return null;
            },
          ),

          // Espaçamento entre os campos
          SizedBox(height: 16),

          // CPF
          TextFormField(
            controller: _quantidadeController,
            decoration: InputDecoration(labelText: 'Quantidade'),
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
        title: Text("Inserir Pedido"),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildForm(context),
        ),
      ),
    );
  }
}

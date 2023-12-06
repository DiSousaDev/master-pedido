import 'package:flutter/material.dart';
import 'package:app/widgets/index.dart';

class InserirClientePage extends StatefulWidget {
  static const String routeName = '/insert';

  @override
  _InserirClienteState createState() => _InserirClienteState();
}

class _InserirClienteState extends State<InserirClientePage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _sobrenomeController = TextEditingController();
  final _cpfController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _sobrenomeController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  void _salvar() async {
    // Banco de Dados para Inserir um Cliente
    // Nada aqui por enquanto
    _nomeController.clear();
    _sobrenomeController.clear();
    _cpfController.clear();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Cliente salvo com sucesso.')));
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Nome
          TextFormField(
            controller: _nomeController,
            decoration: InputDecoration(labelText: 'Nome'),
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
            controller: _sobrenomeController,
            decoration: InputDecoration(labelText: 'Sobrenome'),
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
          SizedBox(height: 64),

          // Botão Salvar
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _salvar();
              }
            },
            child: Text("Salvar"),
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
        title: Text("Inserir Cliente"),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildForm(context),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

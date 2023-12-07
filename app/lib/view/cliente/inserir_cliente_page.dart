import 'package:app/repository/cliente_repository.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/index.dart';

import '../../model/cliente.dart';

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
    if (_formKey.currentState!.validate()) {
      final nome = _nomeController.text;
      final sobrenome = _sobrenomeController.text;
      final cpf = _cpfController.text;
      final novoCliente = Cliente.novo(nome, sobrenome, cpf);

      try {
        ClienteRepository repository = ClienteRepository();
        final clienteInserido = await repository.inserir(novoCliente);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Cliente salvo com sucesso! ID: ${clienteInserido.id}'),
        ));
        Navigator.pushReplacementNamed(context, '/list');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Erro ao salvar o cliente: $e'),
          backgroundColor: Colors.red,
        ));
      }
      _nomeController.clear();
      _sobrenomeController.clear();
      _cpfController.clear();
    }
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
        title: Text("Adicionar novo cliente"),
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

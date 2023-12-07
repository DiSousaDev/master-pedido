import 'package:app/repository/cliente_repository.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/index.dart';

import '../../model/cliente.dart';
import '../../service/error/error.dart';

class EditarClientePage extends StatefulWidget {
  static const String routeName = '/edit';

  @override
  _EditarClienteState createState() => _EditarClienteState();
}

class _EditarClienteState extends State<EditarClientePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _sobrenomeController;
  late TextEditingController _cpfController;

  num? clienteId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    clienteId = args['id'] as num?;
  }

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController();
    _sobrenomeController = TextEditingController();
    _cpfController = TextEditingController();

  }

  @override
  void dispose() {
    _nomeController.dispose();
    _sobrenomeController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  void _salvar() async {
    if (_formKey.currentState!.validate()) {
      String novoNome = _nomeController.text;
      String novoSobrenome = _sobrenomeController.text;
      String novoCpf = _cpfController.text;

      Cliente clienteEditado = Cliente(clienteId, novoNome, novoSobrenome, novoCpf);

      try {
        ClienteRepository repository = ClienteRepository();
        await repository.alterar(clienteEditado);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cliente editado com sucesso!')),
        );
        Navigator.popUntil(context, ModalRoute.withName('/list'));
      } catch (error) {
        showError(context, 'Erro ao editar o cliente', error.toString());
      }
    }
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String nome = args['nome'] as String;
    final String sobrenome = args['sobrenome'] as String;
    final String cpf = args['cpf'] as String;

    _nomeController.text = nome;
    _sobrenomeController.text = sobrenome;
    _cpfController.text = cpf;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Editar"),
      ),
      drawer: AppDrawer(),
      body: _buildForm(context),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

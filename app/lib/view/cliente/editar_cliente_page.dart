import 'package:flutter/material.dart';
import 'package:app/widgets/index.dart';

class EditarClientePage extends StatefulWidget {
  static const String routeName = '/edit';
  @override
  _EditarClienteState createState() => _EditarClienteState();
}

class _EditarClienteState extends State<EditarClientePage> {
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
    // Banco de Dados para Editar um Cliente
    // Nada aqui por enquanto
    _nomeController.clear();
    _sobrenomeController.clear();
    _cpfController.clear();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Cliente editado com sucesso.')));
  }

  Widget _buildForm(BuildContext context) {
    return Column(children: [
      Form(
          key: _formKey,
          child: ListView(shrinkWrap: true, children: [
            //nome
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Nome:"),
              Expanded(
                  child: TextFormField(
                controller: _nomeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                  return null;
                },
              ))
            ]),
            //sobrenome
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Sobrenome:"),
              Expanded(
                  child: TextFormField(
                controller: _sobrenomeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                  return null;
                },
              ))
            ]),
            //cpf
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("CPF:"),
              Expanded(
                  child: TextFormField(
                controller: _cpfController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                  return null;
                },
              ))
            ]),
            //botao salvar
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _salvar();
                    }
                  },
                  child: Text('Editar'),
                ),
              ],
            )
          ])) // Form
    ]);
  }

  @override
  Widget build(BuildContext context) {
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

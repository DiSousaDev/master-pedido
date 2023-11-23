import 'package:app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class EditarProdutoPage extends StatefulWidget {
  static const String routeName = '/edit';
  @override
  _EditarProdutoState createState() => _EditarProdutoState();
}

class _EditarProdutoState extends State<EditarProdutoPage> {
  final _formKey = GlobalKey<FormState>();
  final _descrisaoController = TextEditingController();

  @override
  void dispose() {
    _descrisaoController.dispose();
    super.dispose();
  }

  void _salvar() async {
    // Banco de Dados para Editar um Cliente
    // Nada aqui por enquanto
    _descrisaoController.clear();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Produto editado com sucesso.')));
  }

  Widget _buildForm(BuildContext context) {
    return Column(children: [
      Form(
          key: _formKey,
          child: ListView(shrinkWrap: true, children: [
            //nome
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Descrisão:"),
              Expanded(
                  child: TextFormField(
                controller: _descrisaoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                  return null;
                },
              ))
            ]),
            //sobrenom
            //cpf
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
    return new Scaffold(
      appBar: AppBar(
        title: Text("Editar"),
      ),
      drawer: AppDrawer(),
      body: _buildForm(context),
    );
  }
}

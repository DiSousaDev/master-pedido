import 'package:app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class InserirProdutoPage extends StatefulWidget {
  static const String routeName = '/insert';
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
    // Banco de Dados para Inserir um Cliente
    // Nada aqui por enquanto
    _descrisaoController.clear();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Produto salvo com sucesso.')));
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
            //sobrenome
            //botao salvar
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _salvar();
                    }
                  },
                  child: Text('Salvar'),
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
        title: Text("Inserir produto"),
      ),
      drawer: AppDrawer(),
      body: _buildForm(context),
    );
  }
}

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
        .showSnackBar(SnackBar(content: Text('Produto editado com sucesso.')));
  }

  Widget _buildForm(BuildContext context) {
    return Column(children: [
      Form(
          key: _formKey,
          child: ListView(shrinkWrap: true, children: [
            //nome
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Descrição:"),
              Expanded(
                  child: TextFormField(
                controller: _descricaoController,
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
            SizedBox(height: 64),
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

import 'package:app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ListarProdutoPage extends StatelessWidget {
  static const String routeName = '/produto/listar';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Listagem de Produto"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'Listar produto',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

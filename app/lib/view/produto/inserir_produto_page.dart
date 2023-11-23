import 'package:app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class InserirProdutoPage extends StatelessWidget {
  static const String routeName = '/produto/inserir';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Inserir Produto"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'Inserir produto',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
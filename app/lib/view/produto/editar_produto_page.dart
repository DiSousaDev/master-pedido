import 'package:app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class EditarProdutoPage extends StatelessWidget {
  static const String routeName = '/produto/editar';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Editar Produto"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'Editar produto',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class EditarClientePage extends StatelessWidget {
  static const String routeName = '/editarCliente';

  @override
  Widget build(BuildContext context) {
    // Implemente o conteúdo da página aqui
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Cliente'),
      ),
      body: Center(
        child: Text('Formulário de Edição de Cliente'),
      ),
    );
  }
}

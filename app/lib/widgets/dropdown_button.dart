import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App com Dropdown fora do Drawer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Conteúdo da Tela Principal',
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: 'Cliente',
              items: <String>['Inserir Cliente', 'Listar Cliente']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Implemente a lógica quando um item do dropdown for selecionado
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Text('Menu'),
            ),
            ListTile(
              title: Text('Opção 1'),
              onTap: () {
                // Implemente a lógica quando a opção 1 for selecionada
              },
            ),
            ListTile(
              title: Text('Opção 2'),
              onTap: () {
                // Implemente a lógica quando a opção 2 for selecionada
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app/routes/routes.dart';
import 'package:flutter/material.dart';
import './view/cliente/editar_cliente_page.dart';
import './view/cliente/inserir_cliente_page.dart';
import './view/cliente/listar_cliente_page.dart';
import './widgets/drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master Pedido',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Master pedido'),
      routes: {
        Routes.editCliente: (context) => EditarClientePage(),
        Routes.insertCliente: (context) => InserirClientePage(),
        Routes.listCliente: (context) => ListarClientePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String routeName = '/';

  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: AppDrawer(),
    );
  }
}

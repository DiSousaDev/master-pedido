import 'package:flutter/material.dart';
import './routes/routes.dart';
import './view/cliente/index.dart';
import './view/pedido/index.dart';
import './view/produto/index.dart';
import './widgets/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Master Pedido',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'App Master Pedido'),
      routes: {
        Routes.editCliente: (context) => EditarClientePage(),
        Routes.insertCliente: (context) => InserirClientePage(),
        Routes.listCliente: (context) => ListarClientePage(),
        Routes.editProduto: (context) => EditarProdutoPage(),
        Routes.insertProduto: (context) => InserirProdutoPage(),
        Routes.listProduto: (context) => ListarProdutoPage(),
        Routes.listPedido: (context) => ListarPedidoPage(),
        Routes.insertPedido: (context) => InserirPedidoPage()
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
          backgroundColor: Colors.teal,
          title: Text(widget.title),
        ),
        body: Center(child: Text("Teste BODY")),
        drawer: AppDrawer(),
        bottomNavigationBar: BottomNavigationBarWidget());
  }
}

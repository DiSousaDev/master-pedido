import 'package:app/main.dart';
import '/view/produto/index.dart';
import '/view/cliente/index.dart';
import '/view/pedido/index.dart';

class Routes {
  static const String home = MyHomePage.routeName;
  static const String listCliente = ListarClientePage.routeName;
  static const String insertCliente = InserirClientePage.routeName;
  static const String editCliente = EditarClientePage.routeName;

  static const String listProduto = ListarProdutoPage.routeName;
  static const String insertProduto = InserirProdutoPage.routeName;
  static const String editProduto = EditarProdutoPage.routeName;

  static const String listPedido = ListarPedidoPage.routeName;
  static const String insertPedido = InserirPedidoPage.routeName;
}

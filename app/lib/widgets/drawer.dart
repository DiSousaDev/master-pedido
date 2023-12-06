// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:app/routes/routes.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String dropdownValueCliente = 'Cliente';
  String dropdownValueProduto = 'Produto';
  String dropdownValuePedido = 'Pedido';

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(color: Colors.teal),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 15.0,
              left: 15.0,
              child: Text("Menu",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _createDropdownCliente() {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: DropdownButton<String>(
              underline:
                  Container(), // Remover a linha abaixo do DropdownButton
              value: dropdownValueCliente,
              isExpanded: true,

              onChanged: (String? newValue) {
                setState(() {
                  dropdownValueCliente = newValue!;
                  if (dropdownValueCliente == 'Adicionar novo cliente') {
                    Navigator.pushReplacementNamed(
                        context, Routes.insertCliente);
                  } else if (dropdownValueCliente == 'Pesquisar cliente') {
                    Navigator.pushReplacementNamed(context, Routes.listCliente);
                  }
                });
              },
              items: <String>[
                'Cliente',
                'Adicionar novo cliente',
                'Pesquisar cliente'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createDropdownProduto() {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: DropdownButton<String>(
              underline:
                  Container(), // Remover a linha abaixo do DropdownButton
              value: dropdownValueProduto,
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValueProduto = newValue!;
                  if (dropdownValueProduto == 'Adicionar novo produto') {
                    Navigator.pushReplacementNamed(
                        context, Routes.insertProduto);
                  } else if (dropdownValueProduto == 'Pesquisar produto') {
                    Navigator.pushReplacementNamed(context, Routes.listProduto);
                  }
                });
              },
              items: <String>[
                'Produto',
                'Adicionar novo produto',
                'Pesquisar produto'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createDropdownPedido() {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: DropdownButton<String>(
              underline:
                  Container(), // Remover a linha abaixo do DropdownButton
              value: dropdownValuePedido,
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValuePedido = newValue!;
                  if (dropdownValuePedido == 'Adicionar novo pedido') {
                    Navigator.pushReplacementNamed(
                        context, Routes.insertPedido);
                  } else if (dropdownValuePedido == 'Pesquisar pedido') {
                    Navigator.pushReplacementNamed(context, Routes.listPedido);
                  }
                });
              },
              items: <String>[
                'Pedido',
                'Adicionar novo pedido',
                'Pesquisar pedido'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createRouterHome() {
    return _createDrawerItem(
      icon: Icons.home,
      text: 'Início',
      onTap: () {
        Navigator.pushReplacementNamed(context, Routes.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDropdownCliente(),
          _createDropdownProduto(),
          _createDropdownPedido(),
          Divider(),
          _createRouterHome(), // Add this line to include the home route item
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

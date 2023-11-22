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
        decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
                fit: BoxFit.fitHeight, image: AssetImage('assets/images'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
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
                  if (dropdownValueCliente == 'Inserir Cliente') {
                    Navigator.pushReplacementNamed(
                        context, Routes.insertCliente);
                  } else if (dropdownValueCliente == 'Listar Cliente') {
                    Navigator.pushReplacementNamed(context, Routes.listCliente);
                  }
                });
              },
              items: <String>['Cliente', 'Inserir Cliente', 'Listar Cliente']
                  .map<DropdownMenuItem<String>>((String value) {
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
                  if (dropdownValueProduto == 'Inserir Produto') {
                    Navigator.pushReplacementNamed(context, Routes.listProduto);
                  } else if (dropdownValueProduto == 'Pesquisar Produto') {
                    Navigator.pushReplacementNamed(context, Routes.listProduto);
                  }
                });
              },
              items: <String>['Produto', 'Inserir Produto', 'Pesquisar Produto']
                  .map<DropdownMenuItem<String>>((String value) {
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
                  if (dropdownValuePedido == 'Inserir Pedido') {
                    Navigator.pushReplacementNamed(
                        context, Routes.insertCliente);
                  } else if (dropdownValuePedido == 'Pesquisar Pedido') {
                    Navigator.pushReplacementNamed(context, Routes.listCliente);
                  }
                });
              },
              items: <String>['Pedido', 'Inserir Pedido', 'Pesquisar Pedido']
                  .map<DropdownMenuItem<String>>((String value) {
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
      text: 'Home',
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

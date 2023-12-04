// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:app/routes/routes.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.black38,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Cliente"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Produto"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: "Pedido"),
        ],
        currentIndex: 0,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, Routes.home);
              break;
            case 1:
              Navigator.pushNamed(context, Routes.listCliente);
              break;
            case 2:
              Navigator.pushNamed(context, Routes.listProduto);
              break;
            case 3:
              Navigator.pushNamed(context, Routes.listPedido);
              break;
          }
        });
  }
}

import 'package:flutter/material.dart';
import 'package:meals/screens/products_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _buildMenuItem(IconData icon, String title, Function() hundle) {
    return ListTile(
      onTap: hundle,
      leading: Icon(icon),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text(
              "Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          _buildMenuItem(Icons.home, "Bosh sahifa", () {
            Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
          }),
          Divider(
            height: 0,
          ),
          _buildMenuItem(Icons.category, "Mahsulotlar", () {
            Navigator.of(context).pushReplacementNamed(ProductsScreen.routeName);
          }),
        ],
      ),
    );
  }
}

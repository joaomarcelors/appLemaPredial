import 'package:flutter/material.dart';
import 'package:lema_predial/data/store.dart';
import 'package:lema_predial/providers/auth.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  final userData = Store.getMap('userData');

  Widget _createItem(IconData icon, String label, Function() onTab) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
      onTap: onTab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: DrawerThemeData().backgroundColor,
            ),
            accountName: Text(
              'Bem Vindo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            accountEmail: Text(
              '${Provider.of<Auth>(context, listen: false).usuName}',
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(110),
              child: Image.asset('assets/images/user_lema.png'),
            ),
          ),
          // Container(
          //   height: 120,
          //   width: double.infinity,
          //   child: AppBar(
          //     title: Text(
          //       'Bem Vindo, ${Provider.of<Auth>(context, listen: false).usuName}!',
          //       overflow: TextOverflow.clip,
          //     ),
          //     backgroundColor: Theme.of(context).primaryColor,
          //     automaticallyImplyLeading: false,
          //     centerTitle: true,
          //   ),
          // ),
          SizedBox(height: 20),
          _createItem(Icons.settings, 'Configurações', () => null),
          Divider(),
          _createItem(Icons.logout, 'Sair',
              () => Provider.of<Auth>(context, listen: false).logout()),
          Divider(),
        ],
      ),
    );
  }
}

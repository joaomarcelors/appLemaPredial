import 'package:flutter/material.dart';
import 'package:lema_predial/widgets/caixa_card.dart';

class DashBoardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painel de Leitura'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: CaixaCard(),
    );
  }
}
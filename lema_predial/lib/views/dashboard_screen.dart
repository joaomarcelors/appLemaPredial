import 'package:flutter/material.dart';
import 'package:lema_predial/providers/caixa_dagua.dart';
import 'package:lema_predial/widgets/caixa_card.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  
  Future<void> _refreshInfos(BuildContext context) {
    return Provider.of<CaixaDagua>(context, listen: false).loadInfos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painel de Leitura'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshInfos(context),
        child: FutureBuilder(
          future: Provider.of<CaixaDagua>(context, listen: false).loadInfos(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else if (snapshot.error != null) {
              return Center(child: Text('Ocorreu um erro!'));
            } else {
              return Consumer<CaixaDagua>(
                builder: (ctx, caixaDgua, child) {
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (ctx, i) => CaixaCard(caixaDgua.getInfos),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

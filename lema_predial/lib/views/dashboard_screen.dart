import 'package:flutter/material.dart';
import 'package:lema_predial/providers/caixa_dagua.dart';
import 'package:lema_predial/providers/portao_garagem.dart';
import 'package:lema_predial/widgets/caixa_item.dart';
import 'package:lema_predial/widgets/portao_item.dart';
import 'package:lema_predial/widgets/struct_item.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  Future<void> _refreshInfos(BuildContext context) {
    Provider.of<CaixaDagua>(context, listen: false).loadInfos();
    return Provider.of<PortaoGaragem>(context, listen: false).loadInfos();
    //muda isso dep
  }

  // Future<void> _refreshInfos(BuildContext context) {
  //   return Provider.of<CaixaDagua>(context, listen: false).loadInfos();
  // }

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
          future: _refreshInfos(context),
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
              return ListView(
                children: [
                  Consumer<CaixaDagua>(
                    builder: (ctx, caixaDgua, child) => StructItem(
                      child: CaixaItem(caixaDgua.getInfos),
                    ),
                  ),
                  Consumer<PortaoGaragem>(
                    builder: (ctx, pg, child) => StructItem(
                      child: PortaoItem(pg.getInfos),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

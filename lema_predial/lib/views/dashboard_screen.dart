import 'package:flutter/material.dart';
import 'package:lema_predial/providers/bombaCisterna.dart';
import 'package:lema_predial/providers/caixa_dagua.dart';
import 'package:lema_predial/providers/portao_garagem.dart';
import 'package:lema_predial/widgets/bomba_widget.dart';
import 'package:lema_predial/widgets/build_container.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  Future<void> _refreshInfos(BuildContext context) {
   // Provider.of<CaixaDagua>(context, listen: false).loadInfos();
    return Provider.of<BombaCisterna>(context, listen: false).loadInfos();
   // return Provider.of<PortaoGaragem>(context, listen: false).loadInfos();
    //muda isso depois
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
                  // Consumer<CaixaDagua>(
                  //   builder: (ctx, caixaDgua, child) => buildContainer(
                  //     child: CaixaWidget(caixaDgua.getInfos),
                  //   ),
                  // ),
                  Consumer<BombaCisterna>(
                    builder: (ctx, bcis, child) => buildContainer(
                      child: BombaWidget(bcis.getInfos),
                    ),
                  ),
                  // Consumer<PortaoGaragem>(
                  //   builder: (ctx, pg, child) => buildContainer(
                  //     child: PortaoWidget(pg.getInfos),
                  //   ),
                  // ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

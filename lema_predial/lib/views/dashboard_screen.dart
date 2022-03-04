import 'package:flutter/material.dart';
import 'package:lema_predial/data/file_names.dart';
import 'package:lema_predial/providers/bombas_cisterna.dart';
import 'package:lema_predial/providers/reservatorios.dart';
import 'package:lema_predial/providers/portoes_garagem.dart';
import 'package:lema_predial/widgets/bcis_widget.dart';
import 'package:lema_predial/widgets/build_container.dart';
import 'package:lema_predial/widgets/reservatorio_widget.dart';
import 'package:lema_predial/widgets/portao_garagem_widget.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  Future<void> _refreshInfos(BuildContext context) async {
    await Provider.of<BombasCisterna>(context, listen: false).loadInfos();
    await Provider.of<Reservatorios>(context, listen: false).loadInfos();
    await Provider.of<PortoesGaragem>(context, listen: false).loadInfos();
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
                  for (int idx = 0; idx < NAMES_RESERVATORIO.length; idx++)
                    Consumer<Reservatorios>(
                      builder: (ctx, reservatorio, child) => buildContainer(
                        child: reservatorioWidget(reservatorio.reservatoriosList[idx]),
                      ),
                    ),
                  for (int idx = 0; idx < NAMES_PORTAO.length; idx++)
                    Consumer<PortoesGaragem>(
                      builder: (ctx, pg, child) => buildContainer(
                        child: PortaoGaragemWidget(pg.portoesList[idx]),
                      ),
                    ),
                  for (int idx = 0; idx < NAMES_BCIS.length; idx++)
                    Consumer<BombasCisterna>(
                      builder: (ctx, bcis, child) => buildContainer(
                        child: BcisWidget(bcis.bcisList[idx]),
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

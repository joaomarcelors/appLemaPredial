import 'package:flutter/material.dart';
import 'package:lema_predial/providers/bombas_cisterna.dart';
import 'package:lema_predial/providers/reservatorios.dart';
import 'package:lema_predial/providers/portoes_garagem.dart';
import 'package:lema_predial/utils/app_routes.dart';
import 'package:lema_predial/views/dashboard_screen.dart';
import 'package:lema_predial/views/reservatorio_detail_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Reservatorios(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PortoesGaragem(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => BombasCisterna(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.green,
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.home: (ctx) => DashBoardScreen(),
          AppRoutes.reservatorioDetail: (ctx) => ReservatiorioDetailScreen(),
        },
      ),
    );
  }
}

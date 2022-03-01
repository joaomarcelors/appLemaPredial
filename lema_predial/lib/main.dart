import 'package:flutter/material.dart';
import 'package:lema_predial/providers/caixa_dagua.dart';
import 'package:lema_predial/utils/app_routes.dart';
import 'package:lema_predial/views/dashboard_screen.dart';
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
          create: (ctx) => CaixaDagua(),
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
        },
      ),
    );
  }
}

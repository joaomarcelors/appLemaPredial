import 'package:flutter/material.dart';
import 'package:lema_predial/providers/auth.dart';
import 'package:lema_predial/views/auth_screen.dart';
import 'package:lema_predial/views/dashboard_screen.dart';
import 'package:provider/provider.dart';

class AuthOrHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Auth auth = Provider.of(context);

    return FutureBuilder(
      builder: (ctx, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else if(snapshot.error != null){
          return Center(child: Text('Ocorreu um erro!'));
        }else{
          return auth.isAuth ? DashBoardScreen() : AuthScreen();
        }
      },
    );
  }
}
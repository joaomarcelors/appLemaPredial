import 'package:flutter/material.dart';
import 'package:lema_predial/widgets/auth_widget.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 248, 242, 1),
      body: Center(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 10, bottom: 10, top: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.green[700],
              ),
              height: 450,
              width: 350,
            ),
            Container(
              height: 450,
              width: 350,
              margin: const EdgeInsets.only(
                  left: 10, bottom: 10, top: 16, right: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black26,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 14,
                          color: Colors.black26,
                          offset: Offset(0, 7),
                        ),
                      ],
                    ),
                    height: 100,
                    width: 300,
                    child: Image.asset(
                      'assets/images/logo_lema.jpg',
                      //fit: BoxFit.cover,
                    ),
                  ),
                  Divider(),
                  AuthWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

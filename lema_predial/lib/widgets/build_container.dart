import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lema_predial/providers/portao.dart';

class buildContainer extends StatelessWidget {
  final Widget child;

  const buildContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    double largura = 280;
    double diferenca = 15;

    return Stack(
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 10, bottom: 5, top: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.green[700],
          ),
          height: 325,
        ),
        Container(
          height: 325,
          margin:
              const EdgeInsets.only(left: 16, bottom: 5, top: 10, right: 10),
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
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ],
    );
  }
}

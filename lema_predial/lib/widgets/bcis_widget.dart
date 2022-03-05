import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lema_predial/providers/bomba_cisterna.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BcisWidget extends StatelessWidget {
  final BombaCisterna? bcis;

  const BcisWidget(this.bcis);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.settings,
              size: 28.0,
            ),
            SizedBox(width: 20),
            Text(
              "${bcis!.title}",
              style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato'),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.tune,
              color: Colors.green[700],
              size: 28.0,
            ),
            SizedBox(width: 20),
            Text(
              bcis!.status ? 'Ligada' : 'Desligada',
              style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato'),
            ),
            Text('${Random().nextDouble().toStringAsFixed(4)}'),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.thermostat, //<30 blue <45
              size: 28.0,
              color: bcis!.temperatura < 45
                  ? (bcis!.temperatura < 30 ? Colors.blue[900] : Colors.yellow[600])
                  : Colors.red,
            ),
            SizedBox(width: 20),
            Text(
              "${bcis!.temperatura.toStringAsFixed(0)}º",
              style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato'),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Última leitura: ${DateFormat('HH:mm:ss dd/MM/yyyy').format(bcis!.dateTime)}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

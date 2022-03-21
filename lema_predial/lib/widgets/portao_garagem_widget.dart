import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lema_predial/models/portao_garagem.dart';

class PortaoGaragemWidget extends StatelessWidget {

  final PortaoGaragem? portao;

  PortaoGaragemWidget(this.portao);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.garage,
              size: 28.0,
            ),
            SizedBox(width: 20),
            Text(
              portao!.title,
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
              portao!.status ? Icons.warning_amber : Icons.done,
              color: portao!.status
                  ? Theme.of(context).errorColor
                  : Colors.green[700],
              size: 28.0,
            ),
            SizedBox(width: 20),
            Text(
              portao!.status ? 'Aberto' : 'Fechado',
              style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato'),
            ),
            //Text('${Random().nextDouble().toStringAsFixed(4)}'),
          ],
        ),
        if (portao!.status)
          Row(
            children: [
              Icon(
                Icons.access_time_outlined,
                size: 28.0,
                color: Colors.grey[800],
              ),
              SizedBox(width: 20),
              Text(
                "Aberto há ${portao!.tempoAberto()}",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey[800],
                    fontFamily: 'Lato'),
              ),
            ],
          ),
        Row(
          children: [
            Text(
              'Última leitura: ${DateFormat('HH:mm:ss dd/MM/yyyy').format(portao!.dateTime)}',
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

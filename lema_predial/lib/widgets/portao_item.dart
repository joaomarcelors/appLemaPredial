import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lema_predial/providers/reservatorio.dart';

class PortaoItem extends StatelessWidget {
  final Reservatorio reservatorio;
  late int qtdBoiasTrue;
  PortaoItem(this.reservatorio);

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.garage,
                        size: 28.0,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Portão Garagem A",
                        style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato'),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      //Icons.access_time_outlined, relogio
                      Icons.done,
                      size: 28.0,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Fechado",
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
                      Icons.access_time_outlined,
                      size: 28.0,
                      color: Colors.grey[800],
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Aberto há 00:00:22",
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
                      'Última leitura: ${DateFormat('HH:mm:ss dd/MM/yyyy').format(reservatorio.dateTime)}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNivel(tamanho, color) {
    return Container(
      width: tamanho,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
    );
  }
}

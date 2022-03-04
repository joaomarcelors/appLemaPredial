import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lema_predial/providers/reservatorio.dart';

class reservatorioWidget extends StatelessWidget {

  final Reservatorio? reservatorio;
  late int qtdBoiasTrue;
  reservatorioWidget(this.reservatorio);

  @override
  Widget build(BuildContext context) {

    const largura = 280.0;
    const diferenca = 15.0;

    return Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.inventory,
              size: 28.0,
            ),
            SizedBox(width: 20),
            Text(
              reservatorio!.title,
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
              'Nível: ',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              reservatorio!.getNivel != null
                  ? '${reservatorio!.getNivel!.ceil()} %'
                  : 'Transbordamento',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Column(
          children: [
            for (int i = 0; i < 7; i++)
              _buildNivel(largura - diferenca * i,
                  reservatorio!.selectColor(i + 1)),
          ],
        ),
        Row(
          children: [
            Text(
              'Última leitura: ${DateFormat('HH:mm:ss dd/MM/yyyy').format(reservatorio!.dateTime)}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
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

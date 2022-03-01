import 'package:flutter/material.dart';
import 'package:lema_predial/providers/reservatorio.dart';
import 'package:intl/intl.dart';

class CaixaCard extends StatelessWidget {
  final Reservatorio reservatorio;
  late int qtdBoiasTrue;
  CaixaCard(this.reservatorio);

  @override
  Widget build(BuildContext context) {
    double largura = 280;
    double diferenca = 15;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 10),
            borderRadius: BorderRadius.circular(5),
          ),
          margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
          height: 316,
        ),
        Container(
          height: 325,
          margin: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            
          ),
          child: Card(
            shadowColor: Colors.green,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //bolt
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.inventory,
                          size: 28.0,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Caixa d'água",
                          style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        Text(
                          'Nível: ',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          reservatorio.getNivel != null
                              ? '${reservatorio.getNivel!.ceil()} %'
                              : 'Transbordamento',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  for (int i = 0; i < 7; i++)
                    _buildNivel(largura - diferenca * i,
                        reservatorio.selectColor(i + 1)),

                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                      children: [
                        Text(
                          'Última leitura: ${DateFormat('hh:mm:ss dd/MM/yyyy').format(reservatorio.dateTime)}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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

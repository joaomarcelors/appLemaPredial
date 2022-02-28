import 'package:flutter/material.dart';

class CaixaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double largura = 280;
    double diferenca = 15;
    return SizedBox(
      height: 300,
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
                  children: const[
                    Icon(
                      Icons.inventory,
                      size: 28.0,
                    ),
                    Text(
                      'Caixa d`gua',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Nível:',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      '100 %',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              _buildNivel('sensor 7', largura - diferenca * 0, Colors.white),
              _buildNivel('sensor 6', largura - diferenca * 1, Colors.white),
              _buildNivel('sensor 5', largura - diferenca * 2, Colors.white),
              _buildNivel('sensor 4', largura - diferenca * 3, Colors.white),
              _buildNivel('sensor 3', largura - diferenca * 4, Colors.yellow),
              _buildNivel('sensor 2', largura - diferenca * 5, Colors.yellow),
              _buildNivel('sensor 1', largura - diferenca * 6, Colors.yellow),
              Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      Text('Última leitura: 23:32:41 28/02/2022'),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNivel(nivel, tamanho, color) {
    return Container(
      child: Center(child: Text(nivel)),
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

import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  double largura = 280;
  double diferenca = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painel de Leitura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _buildCard("Caixa d'Água A", '80'),
            _buildCard("Caixa d'Água B", '60'),
            _buildCard('Cisterna A', '100'),
            _buildCard('Cisterna B', '90'),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(nome, nivel) {
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
                  children: [
                    Icon(
                      Icons.inventory,
                      size: 28.0,
                    ),
                    Text(
                      '  ' + nome,
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
                      'Nível: ',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      nivel + '%',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              _buildNivel('sensor 7', largura - diferenca * 0),
              _buildNivel('sensor 6', largura - diferenca * 1),
              _buildNivel('sensor 5', largura - diferenca * 2),
              _buildNivel('sensor 4', largura - diferenca * 3),
              _buildNivel('sensor 3', largura - diferenca * 4),
              _buildNivel('sensor 2', largura - diferenca * 5),
              _buildNivel('sensor 1', largura - diferenca * 6),
              Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      Text('Última leitura: 23:32:41 18/10/2021'),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNivel(nivel, tamanho) {
    return Container(
      child: Center(child: Text(nivel)),
      width: tamanho,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(5),
        color: Color.fromRGBO(0, 153, 255, 1),
      ),
    );
  }
}

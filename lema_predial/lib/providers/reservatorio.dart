import 'package:flutter/material.dart';

class Reservatorio {
  final int cliCod;
  final int qtdBoia;
  final List<bool> boias;
  final DateTime dateTime;

  const Reservatorio({
    required this.cliCod,
    required this.qtdBoia,
    required this.boias,
    required this.dateTime,
  });

  int get _getQtdBoiaTrue{
    return boias.where((boia) => boia).length;
  }

    // 0 0% all white
  // 1 15% 1red ...white
  // 2 30% 2red ...white
  // 3 45% 3yellow
  // 4 60% 4yellow
  // 5 80% 5 blue
  // 6 100% 6blue
  // 7 transbordamento 7 red

  double? get getNivel{
    if(_getQtdBoiaTrue == qtdBoia){
      return null;
    }else{
      return (_getQtdBoiaTrue/(qtdBoia-1))*100;
    }
  }

  Color selectColor (int i){

    int nivel = qtdBoia+1 -i;

    switch(_getQtdBoiaTrue){
      case 7:
        return Colors.red;
      case 6:
        if(nivel < 7)
          return Colors.blue;
      break;
      case 5:
        if(nivel < 6)
          return Colors.blue;
      break;
      case 4:
        if(nivel < 5)
          return Colors.yellow;
      break;
      case 3:
        if(nivel < 4)
          return Colors.yellow;
      break;
      case 2:
        if(nivel < 3)
          return Colors.red;
      break;
      case 1:
        if(nivel < 2)
          return Colors.red;
      break;
    }

    return Colors.white;
  }
}

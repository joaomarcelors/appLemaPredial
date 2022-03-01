import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:lema_predial/providers/reservatorio.dart';
import 'package:lema_predial/utils/constants.dart';

class CaixaDagua with ChangeNotifier {
  Reservatorio? _caixadgua;

  Reservatorio get getInfos{
    return _caixadgua as Reservatorio;
  }

  Future<void> loadInfos() async {
    final response = await http.get(Uri.parse("${Constants.API_URL}/get.php"));

    var data = json.decode(response.body);

    if (data != null) {
      _caixadgua = Reservatorio(
        cliCod: int.parse(data[0]['cli_cod']),
        qtdBoia: int.parse(data[0]['caa_qtd_boia']),
        dateTime: DateTime.parse("${data[0]['caa_data']} ${data[0]['caa_hora']}"),
        boias: [
          (data[0]['caa_boia1'] == '0'),
          (data[0]['caa_boia2'] == '0'),
          (data[0]['caa_boia3'] == '0'),
          (data[0]['caa_boia4'] == '0'),
          (data[0]['caa_boia5'] == '0'),
          (data[0]['caa_boia6'] == '0'),
          (data[0]['caa_boia7'] == '0'),
        ],
      );
    }

    notifyListeners();
    return Future.value();
  }
}

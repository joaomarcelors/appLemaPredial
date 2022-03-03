import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:lema_predial/providers/portao.dart';
import 'package:lema_predial/utils/constants.dart';

class PortaoGaragem with ChangeNotifier {
  
  Portao? _pga;
  Portao get getInfos {
    return _pga as Portao;
  }

  Future<void> loadInfos() async {
    final response =
        await http.get(Uri.parse("${Constants.API_URL}/get_portao_a.php"));

    var data = jsonDecode(response.body);

    print(data);

    if (data != null) {
      _pga = Portao(
        cliCod: int.parse(data[0]['cli_cod']),
        status: data[0]['pga_status'] == '1',
        dateTime:
            DateTime.parse("${data[0]['pga_data']} ${data[0]['pga_hora']}"),
      );
    } else {
      print('sem dados!');
    }


    notifyListeners();
    return Future.value();
  }
}

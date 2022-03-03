import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:lema_predial/providers/bomba.dart';
import 'package:lema_predial/utils/constants.dart';

class BombaCisterna with ChangeNotifier {
  Bomba? _bcis;

  Bomba get getInfos {
    return _bcis as Bomba;
  }

  Future<void> loadInfos() async {
    final response =
        await http.get(Uri.parse('${Constants.API_URL}//get_bcis_a.php'));

    var data = json.decode(response.body);

    print(data);

    if (data != null) {
      _bcis = Bomba(
        cliCod: int.parse(data[0]['cli_cod']),
        status: data[0]['bcis_status'] == '0',
        temperatura: double.parse(data[0]['bcis_temperatura']),
        dateTime:
            DateTime.parse("${data[0]['bcis_data']} ${data[0]['bcis_hora']}"),
      );
      notifyListeners();
    } else {
      print('sem dados');
    }

    return Future.value();
  }
}

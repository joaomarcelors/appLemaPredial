import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:lema_predial/data/file_names.dart';
import 'package:lema_predial/models/portao_garagem.dart';
import 'package:lema_predial/utils/constants.dart';

class PortoesGaragem with ChangeNotifier {
  List<PortaoGaragem> _portoesList = [];
  Timer? _syncApiTimer;
  late int idx;

  List<PortaoGaragem> get portoesList => [..._portoesList];

  int get listCount {
    return _portoesList.length;
  }

  Future<void> loadInfos() async {
    idx = 0;

    for (var name in NAMES_PORTAO) {
      final response =
          await http.get(Uri.parse('${Constants.API_URL}/${name['API']}'));
      var data = json.decode(response.body);

      if (data != null) {
        _portoesList.insert(
          idx,
          PortaoGaragem(
            title: name['title']!,
            api: name['API']!,
            cliCod: int.parse(data[0]['cli_cod']),
            status: data[0][name['status']] == '1',
            dateTime: DateTime.parse(
                "${data[0][name['data']]} ${data[0][name['hora']]}"),
          ),
        );
      }
      idx++;
    }

    notifyListeners();
    _autoSyncAPI();
    return Future.value();
  }

  void _autoSyncAPI() {
    if (_syncApiTimer != null) {
      _syncApiTimer!.cancel();
    }
    //var count = 0;
    _syncApiTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      //print(timer.tick);
      //count++;
      //if (count % 3 == 0) {
      loadInfos();
      // }
    });
  }
}

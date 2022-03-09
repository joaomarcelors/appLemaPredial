import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:lema_predial/data/file_names.dart';
import 'package:lema_predial/models/chart_data.dart';
import 'package:lema_predial/models/reservatorio.dart';
import 'package:lema_predial/utils/constants.dart';

class Reservatorios with ChangeNotifier {
  List<dynamic> _datas = [];
  List<ChartData> _chartData = [];
  List<Reservatorio> _reservatoriosList = [];
  Timer? _syncApiTimer;
  late int idx;

  List<Reservatorio> get reservatoriosList => [..._reservatoriosList];
  List<ChartData> get chartData => [..._chartData];

  //List<ChartData> get registrosList => [..._listRegistros];

  int get listCount {
    return _reservatoriosList.length;
  }

  Future<void> loadInfos() async {
    idx = 0;

    for (var name in NAMES_RESERVATORIO) {
      final response =
          await http.get(Uri.parse('${Constants.API_URL}/${name['API']}'));
      var data = json.decode(response.body);

      if (data != null) {
        _reservatoriosList.insert(
          idx,
          Reservatorio(
            title: name['title']!,
            api: name['API']!,
            cliCod: int.parse(data[0]['cli_cod']),
            qtdBoia: int.parse(data[0][name['qtd_boia']]),
            dateTime: DateTime.parse(
                "${data[0][name['data']]} ${data[0][name['hora']]}"),
            boias: [
              (data[0][name['boia1']] == '0'),
              (data[0][name['boia2']] == '0'),
              (data[0][name['boia3']] == '0'),
              (data[0][name['boia4']] == '0'),
              (data[0][name['boia5']] == '0'),
              (data[0][name['boia6']] == '0'),
              (data[0][name['boia7']] == '0'),
            ],
          ),
        );
      }
      idx++;
    }

    notifyListeners();
    //_autoSyncAPI();
    return Future.value();
  }

  Future<void> loadHistoric(String date) async {
    final response = await http.get(
      Uri.parse('${Constants.API_URL}/get_relatorio_caixa_a.php?data=${date}'),
    );
    // var datas = json.decode(response.body);
    _datas = json.decode(response.body);
    //print(_datas);

    if (_datas != null) {
      _datas as List<dynamic>;
      _chartData = _datas.map((registro) {
        return ChartData(
          DateTime.parse('${registro['caa_data']} ${registro['caa_hora']}'),
          ((([
                        (registro['caa_boia1'] == '0'),
                        (registro['caa_boia2'] == '0'),
                        (registro['caa_boia3'] == '0'),
                        (registro['caa_boia4'] == '0'),
                        (registro['caa_boia5'] == '0'),
                        (registro['caa_boia6'] == '0'),
                        (registro['caa_boia7'] == '0'),
                      ].where((boia) => boia).length) /
                      6) *
                  100)
              .ceil(),
        );
      }).toList();
    }

    return Future.value();
  }

  void _autoSyncAPI() {
    if (_syncApiTimer != null) {
      _syncApiTimer!.cancel();
    }
    //var count = 0;
    _syncApiTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      //print(timer.tick);
      //count++;
      //if (count % 3 == 0) {
      loadInfos();
      // }
    });
  }
}

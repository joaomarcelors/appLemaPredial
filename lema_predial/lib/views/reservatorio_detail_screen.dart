import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lema_predial/models/chart_data.dart';
import 'package:lema_predial/models/reservatorio.dart';
import 'package:lema_predial/providers/reservatorios.dart';
import 'package:lema_predial/widgets/date_picker.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReservatiorioDetailScreen extends StatefulWidget {
  @override
  State<ReservatiorioDetailScreen> createState() =>
      _ReservatiorioDetailScreenState();
}

class _ReservatiorioDetailScreenState extends State<ReservatiorioDetailScreen> {
  Future<void> _refreshHistoric(BuildContext context) {
    return Provider.of<Reservatorios>(context)
        .loadHistoric(DateFormat('yyyy-MM-dd').format(_selectedDate));
  }

  final _tooltip = TooltipBehavior(enable: true);
  bool _isDatePicker = false;
  List<bool> _selections = [true, false, false];
  //final List<int> _selectDays = [0, 1, 2, 30];

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedDatePicker = DateTime.now();

  List<String> _selectDatesString = [
    DateFormat('yyyy-MM-dd').format(DateTime.now()),
    DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 1))),
    DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 2))),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Reservatorios>(context);

    final reservatorio =
        ModalRoute.of(context)!.settings.arguments as Reservatorio;

    return Scaffold(
        appBar: AppBar(
          title: Text('${reservatorio.title}'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: FutureBuilder(
          future: _refreshHistoric(context),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else if (snapshot.error != null) {
              return Center(child: Text('Ocorreu um erro!'));
            } else {
              return Column(
                children: [
                  Container(
                    height: 320,
                    //child: Text('$chartData'),
                    child: SfCartesianChart(
                      title: ChartTitle(text: 'Nível x Tempo'),
                      margin: EdgeInsets.all(16),
                      primaryYAxis: NumericAxis(
                        labelFormat: '{value}%',
                        //maximum: 120,
                      ),
                      primaryXAxis: DateTimeAxis(
                        dateFormat: DateFormat(
                          'HH:mm',
                        ),
                        interval: 4,
                      ),
                      //primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 10),
                      tooltipBehavior: _tooltip,
                      series: <ChartSeries<ChartData, dynamic>>[
                        StepAreaSeries(
                          animationDelay: 1000,
                          animationDuration: 3000,
                          dataSource: provider.chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade50,
                              Colors.blue.shade200,
                              Colors.blue,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ToggleButtons(
                        borderRadius: BorderRadius.circular(5),
                        selectedBorderColor: Theme.of(context).primaryColor,
                        selectedColor: Colors.white,
                        fillColor: Colors.green[400],
                        children: <Widget>[
                          Text('Hoje'),
                          Text('Ontem'),
                          Text(
                              '${DateFormat('dd/MM').format(DateTime.now().subtract(Duration(days: 2)))}'),
                          if (_isDatePicker)
                            Text(
                                '${DateFormat('dd/MM').format(_selectedDatePicker)}'),
                        ],
                        onPressed: (int index) {
                          if(!_selections[index])
                            setState(() {
                              _selections[index] = true;
                              _selectedDate =
                                  DateTime.parse((_selectDatesString[index]));
                              for (int c = 0; c < _selections.length; c++) {
                                if (c != index) {
                                  _selections[c] = false;
                                }
                              }
                            });
                        },
                        isSelected: _selections,
                      ),
                      DatePicker(
                        selectedDate: _selectedDate,
                        onDateChanged: (newDate) {
                          var index = _selectDatesString.indexOf(
                              DateFormat('yyyy-MM-dd').format(newDate));
                          _selections = _isDatePicker
                              ? [false, false, false, false]
                              : [false, false, false];
                          if (index != -1) {
                            _selections[index] = true;
                          } else {
                            _isDatePicker = true;
                            if (_selections.length == 4) {
                              _selections.removeLast();
                              _selectDatesString.removeLast();
                            }
                            _selections.insert(3, true);
                            _selectDatesString.insert(
                                3, DateFormat('yyyy-MM-dd').format(newDate));
                          }
                          setState(() {
                            _selectedDatePicker = newDate;
                            _selectedDate = _selectedDatePicker;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ));
  }
}

class PortaoGaragem {
  
  final String title;
  final String api;
  final int cliCod;
  final bool status;
  final DateTime dateTime;

  PortaoGaragem({
    required this.title,
    required this.api,
    required this.cliCod,
    required this.status,
    required this.dateTime,
  });

  String tempoAberto() {
    int totalSegs = DateTime.now().difference(dateTime).inSeconds;
    int segundo = totalSegs % 60;
    int minutos = totalSegs ~/ 60;
    int minuto = minutos % 60;
    int hora = minutos ~/ 60;

    return '${hora.toString().padLeft(2, '0')}:${minuto.toString().padLeft(2, '0')}:${segundo.toString().padLeft(2, '0')}';
  }
}

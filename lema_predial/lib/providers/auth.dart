import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:lema_predial/data/store.dart';
import 'package:lema_predial/exceptions/auth_exception.dart';
import 'package:lema_predial/utils/constants.dart';

class Auth with ChangeNotifier {
  String? _usuCod;
  String? _usuName;

  bool _isAuth = false;

  bool get isAuth {
    return _isAuth;
  }

  String? get usuName{
    return _usuName;
  }

  Future<void> _authenticate(String user, String password) async {
    final url = '${Constants.API_URL}/auth.php?user=$user&password=$password';
    final response = await http.post(Uri.parse(url));
    final List<dynamic> responseBody = json.decode(response.body);
    print(responseBody);

    if ((responseBody.isEmpty)) {
      print('usuario/senha invalidos');
      throw AuthException('INCORRECT');
    } else {
      _isAuth = true;
      _usuCod = responseBody[0]['usu_cod'];
      _usuName = responseBody[0]['usu_nome'];

      Store.saveMap(
        'userData',
        {
          'cod': _usuCod,
          'userName': _usuName,
        },
      ); //salva os 3 dados deposi da autentificacao

      notifyListeners();
    }
    return Future.value();
  }

  Future<void> login(String user, String password) async {
    return await _authenticate(user, password);
  }

  Future<void> logout() async{
    _isAuth = false;
    await Store.remove('userData');
    notifyListeners();
  }

  Future<void> tryAutoLogin() async {
    if (isAuth) return Future.value();

    final userData = await Store.getMap('userData');

    if (userData == null) return Future.value();

    _isAuth = true;
    _usuCod = userData['cod'];
    _usuName = userData['userName'];
    print('autologin');
    print(_usuCod);
    print(_usuName);
    notifyListeners();
  }
}

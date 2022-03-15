import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:lema_predial/exceptions/auth_exception.dart';
import 'package:lema_predial/utils/constants.dart';

class Auth with ChangeNotifier {

  bool _isAuth = false;

  bool get isAuth {
    return _isAuth;
  }

  Future<void> _authenticate(String user, String password) async{

    final url = '${Constants.API_URL}/auth.php?user=$user&password=$password';
    final response = await http.post(Uri.parse(url));
    final List<dynamic> responseBody = json.decode(response.body);
    print(responseBody);

    if((responseBody.isEmpty)){
      print('usuario/senha invalidos');
      //throw AuthException('INCORRECT');
    }else{
      _isAuth = true;
    }
    notifyListeners();
    return Future.value();
  }

  Future<void> login(String user, String password) async {
    return _authenticate(user, password);
  }
}
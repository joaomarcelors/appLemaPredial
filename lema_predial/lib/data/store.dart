import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static Future<void> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value); //salva a string com chave e valor
  }

  static Future<void> saveMap(String key, Map<String, dynamic> value) async {
    await saveString(
        key, json.encode(value)); //transforma o map em string depois salva
  }

  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<Map<String, dynamic>?> getMap(String key) async {
    try{
      Map<String, dynamic> map = json.decode(await getString(key) as String);
      return map;
    }catch (_){
      return null;
    }
  }

  static Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }  
}

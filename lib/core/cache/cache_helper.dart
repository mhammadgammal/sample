import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static late SharedPreferences _sharedPreferences;

  static init() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static putSting(String key, String value){
    return _sharedPreferences.setString(key, value);
  }

  static String? getString(String key){
    return _sharedPreferences.getString(key);
  }

  static putBoolean(String key, bool value){
    return _sharedPreferences.setBool(key, value);
  }

  static bool? getBoolean(String key){
    return _sharedPreferences.getBool(key);
  }
}
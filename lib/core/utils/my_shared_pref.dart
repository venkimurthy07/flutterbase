import 'package:shared_preferences/shared_preferences.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
class MySharedPref {
  static const TOKEN = "token";

  final SharedPreferences _pref;

  MySharedPref(this._pref);

  void saveToken(String token) {
    _pref.setString(TOKEN, token);
  }

  String getToken() {
    return _pref.getString(TOKEN);
  }

  void logout() {
    _pref.clear();
  }
}

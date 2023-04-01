import 'package:locations_work/core/app/resources/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLang = 'prefsKeyLang';
const String prefsKeyNotifications = 'prefsKeyNotifications';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String language = _sharedPreferences.getString(prefsKeyLang) ??
        LanguageType.english.getValue();
    return language;
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.arabic.getValue()) {
      /// set it to english
      _sharedPreferences.setString(
          prefsKeyLang, LanguageType.english.getValue());
    } else {
      /// set it to arabic
      _sharedPreferences.setString(
          prefsKeyLang, LanguageType.arabic.getValue());
    }
  }

}

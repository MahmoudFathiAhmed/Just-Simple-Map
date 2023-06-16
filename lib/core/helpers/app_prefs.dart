import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locations_work/core/app/resources/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLang = 'prefsKeyLang';
const String prefsKeyNotifications = 'prefsKeyNotifications';
const String prefsKeyWasherLongitude = 'prefsKeyWasherLongitude';
const String prefsKeyWasherLatitude = 'prefsKeyWasherLatitude';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<void> saveWasherLocation(double latitude, double longitude) async{
    _sharedPreferences.setDouble(prefsKeyWasherLatitude, latitude);
    _sharedPreferences.setDouble(prefsKeyWasherLongitude, longitude);
  }

  Future<LatLng?> getWasherLatLong() async{
    LatLng washerLatLong = LatLng(_sharedPreferences.getDouble(prefsKeyWasherLongitude)!, _sharedPreferences.getDouble(prefsKeyWasherLatitude)!);
    return washerLatLong;
  }

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

import 'package:dio/dio.dart';
import 'package:locations_work/core/helpers/app_prefs.dart';
import 'package:locations_work/core/network/network_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';
const String authorization = 'authorization';
const String defaultLanguage = 'language';

class DioFactory {
  final AppPreferences appPreferences;

  DioFactory(this.appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    // String language=await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      // authorization: 'Bearer ${NetworkConstants.token}',
      // defaultLanguage: language // get it from app prefs
    };

    dio.options = BaseOptions(
        baseUrl: NetworkConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: headers,
        receiveTimeout:
            const Duration(milliseconds: NetworkConstants.apiTimeOut),
        sendTimeout: const Duration(milliseconds: NetworkConstants.apiTimeOut));

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
    return dio;
  }
}

import 'package:dio/dio.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error is its an error from response of the api or from dio itself
      failure = _handleError(error);
    } else {
      failure = DataSource.unKnown.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioErrorType.cancel:
      return DataSource.cancel.getFailure();
    case DioErrorType.badResponse:
      return DataSource.badResponse.getFailure();
    default:
      return DataSource.unKnown.getFailure();
  }
}

enum DataSource {
  success,
  noContent,
  badResponse,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  unKnown
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badResponse = 400; // failure api rejected request
  static const int unauthorized = 401; // failure, user is not authorized
  static const int forbidden = 403; // failure api rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, page not found
  //local status code
  static const int connectTimeOut = -1;
  static const int cancel = -2;
  static const int receiveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int unKnown = -7;
}

class ResponseMessage {
  static const String success = "success"; // success with data
  static const String noContent =
      "success"; // success with no data (no content)
  static const String badResponse =
      "Bad response, Try again later"; // failure api rejected request
  static const String unauthorized =
      "User is not authorised, please try again"; // failure, user is not authorized
  static const String forbidden =
      "Forbidden request, try again later"; // failure api rejected request
  static const String internalServerError =
      "Some thing went wrong, try again later"; // failure, crash in server side
  static const String notFound =
      "the website you were trying to reach couldn't be found on the server";

  static const String connectTimeOut = "Time out error, try again";
  static const String cancel = "Request was cancelled";
  static const String receiveTimeOut = "Time out error, try again";
  static const String sendTimeOut = "Time out error, try again";
  static const String cacheError = "Cache error, try again";
  static const String noInternetConnection =
      "Please check your internet connection";
  static const String unKnown = "Some thing went wrong, try again";
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSource.badResponse:
        return Failure(ResponseCode.badResponse, ResponseMessage.badResponse);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return Failure(
            ResponseCode.connectTimeOut, ResponseMessage.connectTimeOut);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failure(
            ResponseCode.receiveTimeOut, ResponseMessage.receiveTimeOut);
      case DataSource.sendTimeOut:
        return Failure(ResponseCode.sendTimeOut, ResponseMessage.sendTimeOut);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSource.unKnown:
        return Failure(ResponseCode.unKnown, ResponseMessage.unKnown);
    }
  }
}
class ApiInternalStatus{
  static const int success=0;
  static const int failure=1;
}
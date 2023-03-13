import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:locations_work/core/network/error_handler.dart';
import 'package:locations_work/core/network/failure.dart';
import 'package:locations_work/core/network/network_constants.dart';
import 'package:locations_work/modules/base/repository/base_repository.dart';
import 'package:locations_work/modules/date_time/models/available_response.dart';

class DateTimeRepository extends BaseRepository {

  Future<Either<Failure, AvailableResponse>> getAllSubscriptions() async {
    if (await networkInfo.isConnected) {
      //its connected to internet , its safe to call API
      try {
        late final dynamic response;
        await dio.getDio().then((value) async {
          response = await value.get(NetworkConstants.baseUrl);
        });

        if (response.statusCode == 200) {
          //success return data
          return Right(AvailableResponse.fromJson(response.data));
        } else {
          //failure -- return business error
          return Left(
              Failure(ApiInternalStatus.failure, ResponseMessage.unKnown));
        }
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      //return internet connection error
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
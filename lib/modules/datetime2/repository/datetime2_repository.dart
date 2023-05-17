import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:locations_work/core/network/error_handler.dart';
import 'package:locations_work/core/network/failure.dart';
import 'package:locations_work/core/network/network_constants.dart';
import 'package:locations_work/modules/base/repository/base_repository.dart';
import 'package:locations_work/modules/datetime2/models/availability_response.dart';
import 'package:locations_work/modules/datetime2/models/availability_response2.dart';

class DateTime2Repository extends BaseRepository{
  Future<Either<Failure, AvailabilityResponse>> getWaiting() async {
    if (await networkInfo.isConnected) {
      //its connected to internet , its safe to call API
      try {
        late final dynamic response;
        await dio.getDio().then((value) async {
          response = await value.get(NetworkConstants.availabilityApi);
        });

        if (response.statusCode == 200) {
          //success return data
          return Right(AvailabilityResponse.fromJson(response.data));
        } else {
          //failure -- return business error
          return Left(
              Failure(ApiInternalStatus.failure, ResponseMessage.unKnown));
        }
      } on DioError catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return internet connection error
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
  Future<Either<Failure, List<AvailabilityResponse2>>> getWaiting2() async {
    if (await networkInfo.isConnected) {
      //its connected to internet , its safe to call API
      try {
        late final dynamic response;
        await dio.getDio().then((value) async {
          response = await value.get(NetworkConstants.availability2Api);
        });

        if (response.statusCode == 200) {
          print('******88${DateTime.now().toIso8601String()}');
          List<dynamic> jsonResponse = response.data;
          //success return data
          return Right(jsonResponse.map((json) => AvailabilityResponse2.fromJson(json)).toList());
        } else {
          //failure -- return business error
          return Left(
              Failure(ApiInternalStatus.failure, ResponseMessage.unKnown));
        }
      } on DioError catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return internet connection error
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}

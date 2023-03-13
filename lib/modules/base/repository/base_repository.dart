

import 'package:locations_work/core/helpers/service_locator.dart';
import 'package:locations_work/core/network/dio_factory.dart';
import 'package:locations_work/core/network/network_info.dart';

abstract class BaseRepository{
  late NetworkInfo networkInfo;
  late DioFactory dio;

  BaseRepository(){
    networkInfo=getIt.get<NetworkInfo>();
    dio=getIt.get<DioFactory>();
  }
}
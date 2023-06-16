import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:locations_work/core/helpers/app_prefs.dart';
import 'package:locations_work/core/network/dio_factory.dart';
import 'package:locations_work/core/network/network_info.dart';
import 'package:locations_work/modules/date_time/repository/date_time_repository.dart';
import 'package:locations_work/modules/datetime2/repository/datetime2_repository.dart';
import 'package:locations_work/modules/google_map/repository/map_repository.dart';
import 'package:locations_work/modules/radio_list_tile/repository/vehicle_repository.dart';
import 'package:locations_work/modules/translation/repository/trans_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


final getIt = GetIt.instance;

class ServicesLocator {
  void init() async {
    ///Dio Factory
    getIt.registerLazySingleton<DioFactory>(() => DioFactory(getIt()));

    ///App Preferences
    getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(getIt()));

    ///Shared Preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    /// Network info
    getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

    /// Network Connection checker
    getIt.registerLazySingleton<InternetConnectionChecker>(
        () => InternetConnectionChecker());

    // DateTime Repository
    getIt.registerLazySingleton<DateTimeRepository>(() => DateTimeRepository());
    getIt.registerLazySingleton<VehicleRepository>(() => VehicleRepository());
    getIt.registerLazySingleton<TransRepository>(() => TransRepository());
    getIt.registerLazySingleton<DateTime2Repository>(() => DateTime2Repository());
    getIt.registerLazySingleton<MapRepository>(() => MapRepository());

  
  }
}

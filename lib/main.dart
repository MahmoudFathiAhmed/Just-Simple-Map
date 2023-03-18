/*
 * 1-just current location
 * 2-location by marker
 * 3-get lat and long
 * 4- location around specific location
 * 
 * notes:
 * compile sdk 33
 * min sdk 21
 * 
 */
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:locations_work/core/helpers/bloc_observer.dart';
import 'package:locations_work/core/helpers/service_locator.dart';
import 'package:locations_work/core/routes/app_routes.dart';
import 'package:locations_work/modules/date_time/cubit/cubit/date_time_cubit.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    Bloc.observer = MyBlocObserver();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => DateTimeCubit(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Locations Work',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}

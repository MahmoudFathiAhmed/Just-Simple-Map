import 'package:flutter/material.dart';
import 'package:locations_work/core/routes/app_routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations Work'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.justlatLongScreenRoute);
                },
                child: const Text('just lat long screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.googleMapScreenRoute);
                },
                child: const Text('google maps screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.dateTimeScreenRoute);
                },
                child: const Text('DateTime screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.testScreenRoute);
                },
                child: const Text('Test screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.screen1Route);
                },
                child: const Text('To Screen 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.notificationsScreenRoute);
                },
                child: const Text('To Notifications Screen'),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, Routes.cameraScreenRoute);
              //   },
              //   child: const Text('To Camera Screen'),
              // ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.addScreenRoute);
                },
                child: const Text('To Camera Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.dictionaryScreenRoute);
                },
                child: const Text('To Dictionary Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.randomColorScreenRoute);
                },
                child: const Text('Random Color Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, Routes.firebaseNotificationsScreenRoute);
                },
                child: const Text('Firebase Notifications'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, Routes.selectDateUpdateOrderScreenRoute);
                },
                child: const Text('Select Date Update Order Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.countryCodeScreenRoute);
                },
                child: const Text('Country Code Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.test1ScreenRoute);
                },
                child: const Text('test1'),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, Routes.radioScreenRoute);
              //   },
              //   child: const Text('Radio Work'),
              // ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.radioListtileScreenRoute);
                },
                child: const Text('Radio Listtile Work'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.contactUsScreenRoute);
                },
                child: const Text('contact us'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

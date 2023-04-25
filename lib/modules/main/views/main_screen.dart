import 'package:flutter/material.dart';
import 'package:locations_work/core/routes/app_routes.dart';
import 'package:locations_work/modules/main/widgets/exit_confirmation_dialog.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool shouldExit = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return const ExitConfirmationDialog();
          },
        );
        // If the user confirmed, exit the app.
        if (!shouldExit) {
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.justlatLongScreenRoute);
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
                      Navigator.pushNamed(context, Routes.screen1Route);
                    },
                    child: const Text('To Screen 1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.notificationsScreenRoute);
                    },
                    child: const Text('To Notifications Screen'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.dictionaryScreenRoute);
                    },
                    child: const Text('To Dictionary Screen'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.randomColorScreenRoute);
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
                      Navigator.pushNamed(
                          context, Routes.countryCodeScreenRoute);
                    },
                    child: const Text('Country Code Screen'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.contactUsScreenRoute);
                    },
                    child: const Text('contact us'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.radioListtileScreenRoute);
                    },
                    child: const Text('Radio Listtile Work'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.picturePreviewScreenRoute);
                    },
                    child: const Text('picture'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

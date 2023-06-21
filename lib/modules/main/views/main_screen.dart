import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:locations_work/core/helpers/app_prefs.dart';
import 'package:locations_work/core/helpers/localization_helper.dart';
import 'package:locations_work/core/helpers/service_locator.dart';
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
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.language),
                  onPressed: () async {
                    await LocalizationHelper.changeLanguage(context);
                    Get.updateLocale(context.locale);
                    await getIt.get<AppPreferences>().changeAppLanguage();
                    Phoenix.rebirth(context);
                  },
                ),
              ),
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
                          Navigator.pushNamed(context, Routes.googleMapScreen2Route);
                        },
                        child: const Text('google maps screen2'),
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
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.transScreenRoute);
                        },
                        child: const Text('Trans'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.dateTime2ScreenRoute);
                        },
                        child: const Text('dateTime2'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.counterRoute);
                        },
                        child: const Text('Hydrated'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.dateTestRoute);
                        },
                        child: const Text('DateTest'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.hooksRoute);
                        },
                        child: const Text('hooks examples'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.expandableExampleRoute);
                        },
                        child: const Text('expandable example'),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.containersScreenRoute);
                        },
                        child: const Text('Containers Screen'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.checkBoxScreenRoute);
                        },
                        child: const Text('Check Box Screen'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.toggleScreenRoute);
                        },
                        child: const Text('Toggle Screen'),
                      ),

                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, Routes.liveTrackingRoute);
                      //   },
                      //   child: const Text('To Live Tracking Screen'),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}

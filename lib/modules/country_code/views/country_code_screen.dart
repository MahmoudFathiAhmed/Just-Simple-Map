import 'package:flutter/material.dart';
import 'package:locations_work/core/routes/app_routes.dart';
import 'package:locations_work/main.dart';
import 'package:locations_work/modules/just_lat_long/views/just_lat_long_screen.dart';

//itembutton
class CountryCodeScreen extends StatefulWidget {
  const CountryCodeScreen({super.key});

  @override
  State<CountryCodeScreen> createState() => _CountryCodeScreenState();
}

class _CountryCodeScreenState extends State<CountryCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 20),
            Container(
              height: 80,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [BoxShadow(blurRadius: 1)]),
              child: Row(
                children: [
                  const Spacer(),
                  PopupMenuButton(
                    onSelected: (value) {
                      switch (value) {
                        case 0:
                          _openJustLatLong(context);
                      }
                    },
                    itemBuilder: ((context) => [
                          PopupMenuItem(
                            value: 0,
                            onTap: () {
                              navigatorKey.currentState!.push(MaterialPageRoute(
                                  builder: ((context) =>
                                      const JustLatLongScreen())));
                            },
                            child: Row(
                              children: const [
                                Icon(Icons.add),
                                SizedBox(width: 2),
                                Text('Nav')
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 0,
                            onTap: () {
                              navigatorKey.currentState!.push(MaterialPageRoute(
                                  builder: ((context) =>
                                      const JustLatLongScreen())));
                            },
                            child: SquareIconTextButton(
                              icon: Icons.add,
                              iconColor: Colors.red,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.justlatLongScreenRoute);
                              },
                              bgColor: Colors.red.withOpacity(.3),
                              text: 'text',
                            ),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> _openJustLatLong(BuildContext context) async {
    debugPrint('justLatLong');
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => JustLatLongScreen()));
    // await Navigator.pushNamed(context, Routes.justlatLongScreenRoute);
    debugPrint('justLatLong completed');
  }
}

class SquareIconTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final double width;
  final double radius;
  final double padding;
  final Color bgColor;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final Color textColor;

  const SquareIconTextButton({
    Key? key,
    required this.onTap,
    this.height = 40,
    this.width = 80,
    this.radius = 5,
    this.bgColor = Colors.red,
    this.padding = 0,
    required this.icon,
    this.iconSize = 24,
    required this.iconColor,
    required this.text,
    this.fontWeight = FontWeight.bold,
    this.textColor = Colors.red,
    this.textSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        padding: EdgeInsets.all(padding),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: iconSize,
              ),
              const SizedBox(width: 3),
              Text(
                text,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor,
                  fontSize: textSize,
                  fontWeight: fontWeight,
                ),
              )
            ]),
      ),
    );
  }
}

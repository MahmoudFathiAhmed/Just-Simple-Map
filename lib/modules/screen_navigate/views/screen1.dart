import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:locations_work/core/routes/app_routes.dart';
import 'package:locations_work/core/routes/routes_arguments.dart';
import 'package:locations_work/modules/screen_navigate/models/my_model.dart';
import 'package:locations_work/modules/screen_navigate/views/screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController controller = TextEditingController();
  TextEditingController countryController = TextEditingController();
  String? countryFlag;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        onSelect: (country) {
                          setState(() {
                            countryController.text = '+${country.phoneCode}';
                            countryFlag = country.flagEmoji;
                            debugPrint(countryFlag);
                          });
                        },
                        favorite: ['JO', 'SA', 'EG'],
                      );
                    },
                    child: TextFormField(
                      controller: countryController,
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: countryController.text == ''
                            ? const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '+962',
                                  style: TextStyle(fontSize: 18),
                                ))
                            : Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  countryController.text,
                                  style: TextStyle(fontSize: 18),
                                )),
                        suffixIcon: countryFlag == null
                            ? const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '🇯🇴',
                                  style: TextStyle(fontSize: 18),
                                ),
                              )
                            : Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  countryFlag!,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                        // contentPadding: EdgeInsets.all(10)
                        // hintText: countryFlag == null
                        //     ? '🇯🇴 +962'
                        //     : '$countryFlag ${countryController.text}'
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 7,
                  child: TextFormField(
                    controller: controller,
                  ),
                ),
              ],
            ),
            Center(
                child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.screen2Route,
                    arguments:
                        MyArgument(myModel: MyModel(name: controller.text)));
              },
              icon: const Icon(Icons.navigate_next),
            )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:locations_work/modules/test1/widgets/test1_widget.dart';

class Test1Screen extends StatefulWidget {
  const Test1Screen({
    Key? key,
  }) : super(key: key);

  @override
  State<Test1Screen> createState() => _Test1ScreenState();
}

class _Test1ScreenState extends State<Test1Screen> {
  String groupValue = '';
  String vehicleId = '';
  String vehicleDescription = '';
  double vehiclePrice = 0;
  bool navigateToNextPage = false;
  List<String> titles = ['girl', 'wolf', 'lemon'];
  List<String> images = [
    'https://www.pngitem.com/pimgs/m/434-4349470_transparent-kawaii-pixel-girl-png-png-download.png',
    'https://www.kindpng.com/picc/m/701-7019449_flareon-pixel-art-png-download-make-pixel-art.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNXJ8TGeRtfnOY3eoPZUEMjzBAcTnYGTNdhu71wWOP8tV1FRFaRWJGhPMUVFSvn28S5c4&usqp=CAU'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('test1')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              const Text(
                'select',
              ),
              const SizedBox(height: 20),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Test1Widget(
                        text: titles[index],
                        imageUrl: images[index],
                        radioValue: titles[index],
                        radioGroupValue: groupValue,
                        boxShadow: titles[index] == groupValue
                            ? []
                            : [
                                const BoxShadow(
                                  offset: Offset(0, 0),
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 10,
                                  color: Colors.blue,
                                )
                              ],
                        onChanged: (value) {
                          setState(() {
                            groupValue = value!;
                            navigateToNextPage = true;
                          });
                        },
                        backgroundColor: Colors.white,
                      ),
                    );
                  }),
              // const Spacer(),
              SizedBox(height: MediaQuery.of(context).size.height * .54),
              Center(
                child: MaterialButton(
                  onPressed: () {},
                  child: const Text('anything'),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

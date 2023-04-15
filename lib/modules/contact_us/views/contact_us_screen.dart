import 'package:flutter/material.dart';
import 'package:locations_work/core/utils/image_assets.dart';
import 'package:locations_work/modules/contact_us/contact_us_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> logos = [
      ImageAssets.faceLogo,
      ImageAssets.whatsLogo,
      ImageAssets.instaLogo,
      ImageAssets.twitterLogo,
    ];
    List<String> titles = [
      'Facebook',
      'Whatsapp',
      'Instagram',
      'Twitter',
    ];
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: SvgPicture.asset(
              ImageAssets.contactUs,
              height: 280,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Contact Us via:'),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * .42,
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: titles.length,
                shrinkWrap: true,
                primary: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return ContactUsItem(
                    image: logos[index],
                    title: titles[index],
                    onTap: () {},
                  );
                }),
          )
        ]),
      ),
    );
  }
}

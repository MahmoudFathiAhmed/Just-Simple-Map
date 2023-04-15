import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUsItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  const ContactUsItem(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: 50,
            ),
            const SizedBox(height: 15),
            Text(title)
          ],
        ),
      ),
    );
  }
}

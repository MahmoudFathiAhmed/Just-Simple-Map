import 'package:flutter/material.dart';

class PressToTakeAPictureWidget extends StatelessWidget {
  final VoidCallback onTab;
  final String text;
  const PressToTakeAPictureWidget(
      {Key? key, required this.onTab, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTab,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 340,
            height: 192,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.02),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.camera_enhance_outlined,
              color: Colors.blue,
              size: 83,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            text,
          ),
        )
      ],
    );
  }
}

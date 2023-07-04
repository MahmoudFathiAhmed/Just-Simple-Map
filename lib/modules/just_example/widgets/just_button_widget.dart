import 'package:flutter/material.dart';

class JustButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;

  const JustButtonWidget(
      {super.key,
      required this.onTap,
      required this.text,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
                color: isSelected ? Colors.deepPurple : Colors.grey.shade400,
                fontSize: 17),
          ),
          const SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 4,
            decoration: BoxDecoration(
                color: isSelected ? Colors.orange : Colors.grey,
                borderRadius: BorderRadius.circular(20)),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HourButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final DateTime hour;
  final Color color;
  final Color availabilityColor;

  const HourButtonWidget({
    Key? key,
    required this.onTap,
    required this.hour,
    this.color = Colors.white,
    required this.availabilityColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            height: 35,
            width: 80,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 10),
                ]),
            child: Center(child: Text(hour.toString().substring(11, 16))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            radius: 4,
            backgroundColor: availabilityColor,
          ),
        ),
      ],
    );
  }
}

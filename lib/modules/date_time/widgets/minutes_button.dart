import 'package:flutter/material.dart';

class MinutesButton extends StatelessWidget {
  final String hour;
  final Color buttonColor;
  final Color availabilityColor;
  final VoidCallback? onTap;

  const MinutesButton({
    super.key,
    required this.hour,
    required this.availabilityColor,
    required this.onTap,
    this.buttonColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(alignment: AlignmentDirectional.topEnd, children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: MediaQuery.of(context).size.height * .06,
            width: MediaQuery.of(context).size.width * .19,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.05),
                    blurRadius: 10),
              ],
            ),
            child: Center(
                child: Text(
              hour,
              style: const TextStyle(fontSize:12, color: Colors.black),
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            radius: 4,
            backgroundColor: availabilityColor,
          ),
        ),
      ]),
    );
  }
}
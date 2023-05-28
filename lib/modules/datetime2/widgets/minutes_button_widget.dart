import 'package:flutter/material.dart';
class MinutesButtonWidget extends StatelessWidget {
  final DateTime hour;
  final Color buttonColor;
  final Color availabilityColor;
  final VoidCallback? onTap;
  // final bool selected;
  const MinutesButtonWidget({
    super.key,
    required this.hour,
    required this.availabilityColor,
    required this.onTap,
    required this.buttonColor,
    // this.buttonColor = Colors.white,
    // required this.selected,
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
              color:
              // isImpossibleToMakeOrder(
              //     time: hour)
              //     ? Colors.grey.shade300:
              // selected ? Colors.blue :
              buttonColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.05), blurRadius: 10),
              ],
            ),
            child: Center(
                child: Text(
              hour.toString().toString().substring(11, 16),
              style: const TextStyle(fontSize: 12, color: Colors.black),
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

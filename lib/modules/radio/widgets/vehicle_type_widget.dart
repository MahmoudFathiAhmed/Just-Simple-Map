import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleTypeWidget extends StatelessWidget {
  final String text;
  final double price;
  final String radioValue;
  final String radioGroupValue;
  final String imageUrl;
  final Function(String?) onChanged;
  final Color backgroundColor;
  final void Function()? infoFunc;
  final List<BoxShadow>? boxShadow;


  const VehicleTypeWidget({
    Key? key,
    required this.text,
    required this.price,
    required this.radioValue,
    required this.radioGroupValue,
    required this.onChanged,
    required this.backgroundColor,
    required this.imageUrl,
    this.infoFunc,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2.5),
      margin: const EdgeInsets.symmetric(vertical: 2.5),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: boxShadow),
      child: Row(
        children: [
          Radio(
            // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: radioValue,
            groupValue: radioGroupValue,
            onChanged: onChanged,
            activeColor: Colors.blue,
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.maximumDensity,
              vertical: VisualDensity.maximumDensity,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Image.network(
            imageUrl,
            height: 23,
            width: 40,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelSmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            '$price\$',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          IconButton(
            onPressed: infoFunc,
            splashRadius: 20,
            padding: EdgeInsets.zero,
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            icon: const Icon(
              Icons.info_outline,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

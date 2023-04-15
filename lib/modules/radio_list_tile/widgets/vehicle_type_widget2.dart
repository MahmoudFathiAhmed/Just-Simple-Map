import 'package:flutter/material.dart';

class VehicleTypeWidget2 extends StatelessWidget {
  final String text;
  final double price;
  final String radioValue;
  final String radioGroupValue;
  final String imageUrl;
  final Function(String?) onChanged;
  final Color backgroundColor;
  final void Function()? infoFunc;
  final List<BoxShadow>? boxShadow;

  const VehicleTypeWidget2({
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
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
                borderRadius: BorderRadius.circular(8), boxShadow: boxShadow),
            child: RadioListTile(
              // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              selected: radioValue == radioGroupValue,
              value: radioValue,
              groupValue: radioGroupValue,
              onChanged: onChanged,
              activeColor: Colors.blue,
              visualDensity: VisualDensity(
                horizontal: VisualDensity.comfortable.horizontal,
                vertical: VisualDensity.comfortable.vertical,
              ),
              selectedTileColor: Colors.blue.withOpacity(.1),
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: Row(
                children: [
                  Image.network(
                    imageUrl,
                    height: 35,
                    width: 35,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '$price\$',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

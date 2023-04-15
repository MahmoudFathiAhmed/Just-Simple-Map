import 'package:flutter/material.dart';

class UserLocationWidget extends StatelessWidget {
  final String radioValue;
  final String radioGroupValue;
  final Function(String?) onChanged;
  final String place;
  final String specificLocation;
  const UserLocationWidget(
      {super.key,
      required this.radioValue,
      required this.radioGroupValue,
      required this.onChanged,
      required this.place,
      required this.specificLocation});

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        visualDensity: VisualDensity(
          horizontal: VisualDensity.standard.horizontal,
          vertical: VisualDensity.standard.vertical,
        ),
        value: radioValue,
        groupValue: radioGroupValue,
        selected: radioValue == radioGroupValue,
        selectedTileColor: Colors.blue.withOpacity(.1),
        contentPadding: EdgeInsets.zero,
        title: Text(
          place,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        subtitle: SizedBox(
          width: MediaQuery.of(context).size.width * .65,
          child: Text(
            specificLocation,
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onChanged: onChanged);
  }
}
  // List<String> locations = ['home location', 'office location'];
  // List<String> specificlocations = ['cairo Egypt', 'cairo Egypt'];
  // String radioGroupValue = '';
                        // UserLocationWidget(
                        //   onChanged: (value) {
                        //     setState(() {
                        //       radioGroupValue = value!;
                        //     });
                        //   },
                        //   place: locations[index],
                        //   radioGroupValue: radioGroupValue,
                        //   radioValue: locations[index],
                        //   specificLocation: specificlocations[index],
                        // ),
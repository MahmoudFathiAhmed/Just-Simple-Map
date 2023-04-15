import 'package:flutter/material.dart';

class PaymentOptionWidget extends StatelessWidget {
  final String method;
  final String radioValue;
  final String radioGroupValue;
  final Function(String?) onChanged;
  const PaymentOptionWidget(
      {super.key,
      required this.method,
      required this.radioValue,
      required this.radioGroupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      activeColor: Colors.blue,
      visualDensity: VisualDensity(
        horizontal: VisualDensity.standard.horizontal,
        vertical: VisualDensity.standard.vertical,
      ),
      selected: radioValue == radioGroupValue,
      selectedTileColor: Colors.blue.withOpacity(.1),
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      value: radioValue,
      title: Text(
        method,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      groupValue: radioGroupValue,
      onChanged: onChanged,
    );
  }
}
// List<String> methods = ['cash', 'methods'];
// String methodsGroupValue = '';
// PaymentOptionWidget(
                        //   method: methods[index],
                        //   onChanged: (value) {
                        //     setState(() {
                        //       methodsGroupValue = value!;
                        //     });
                        //   },
                        //   radioGroupValue: methodsGroupValue,
                        //   radioValue: methods[index],

                        // ),

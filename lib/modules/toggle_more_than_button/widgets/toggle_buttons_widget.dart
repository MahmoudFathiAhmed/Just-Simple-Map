import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/core/app/components.dart';
import 'package:locations_work/modules/toggle_more_than_button/blocs/button_toggle_bloc.dart';
import 'package:locations_work/modules/toggle_more_than_button/blocs/button_toggle_event.dart';

class ToggleButtonsWidget extends StatelessWidget {
  final Function(String) onButtonPressed;

  const ToggleButtonsWidget({
    super.key,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonToggleBloc(),
      child: BlocBuilder<ButtonToggleBloc, ButtonIndex>(
        builder: (buttonToggleContext, indexState) {
          return MySpecialMagicGridView(
            listCount: ButtonIndex.values.length,
            generatedWidget: (index) => ElevatedButton(
              onPressed: () {
                buttonToggleContext
                    .read<ButtonToggleBloc>()
                    .add(ButtonToggleEvent(ButtonIndex.values[index]));
                onButtonPressed.call(ButtonIndex.values[index].description);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: indexState == ButtonIndex.values[index]
                    ? Colors.amber
                    : Colors.white,
              ),
              child: Text(ButtonIndex.values[index].description),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/modules/just_example/bloc/just_toggle_bloc.dart';
import 'package:locations_work/modules/just_example/bloc/just_toggle_event.dart';
import 'package:locations_work/modules/just_example/widgets/just_button_widget.dart';

class JustSelectRow extends StatelessWidget {
  final Function(String) onButtonPressed;
  const JustSelectRow({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JustToggleBloc(),
      child: BlocBuilder<JustToggleBloc, JustButtonIndex>(
        builder: (justToggleContext, justButtonIndexState) {
          return Row(
              children: List.generate(JustButtonIndex.values.length, (index) =>
                  Expanded(child: JustButtonWidget(onTap: () {
                    justToggleContext.read<JustToggleBloc>().add(
                        JustToggleEvent(JustButtonIndex.values[index]));
                    onButtonPressed.call(JustButtonIndex.values[index].description);
                  },
                      text: JustButtonIndex.values[index].description,
                    isSelected: justButtonIndexState==JustButtonIndex.values[index],
                      ))
              ));
        },
      ),
    );
  }
}

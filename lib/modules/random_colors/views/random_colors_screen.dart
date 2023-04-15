import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:locations_work/modules/random_colors/bloc/bloc/color_bloc.dart';

class RandomColorScreen extends StatelessWidget {
  const RandomColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBloc(),
      child: BlocBuilder<ColorBloc, ColorState>(
        builder: (context, colorState) {
          Color backgroundColor = colorState is ColorGeneratedState
              ? colorState.color
              : Colors.white;
          return GestureDetector(
            onTap: () {
              context.read<ColorBloc>().add(GenerateColorEvent());
            },
            child: Scaffold(
                backgroundColor: backgroundColor,
                appBar: AppBar(
                  title: const Text(
                    'Random colors Generator',
                    style: TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                  backgroundColor: backgroundColor,
                  elevation: 0,
                ),
                body: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Hello there',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}

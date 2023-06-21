import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleButtons extends StatelessWidget {
  const ToggleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleBloc = BlocProvider.of<ToggleBloc>(context);

    return Row(
      children: [
        MaterialButton(
          child: Text('Button 1'),
          color: toggleBloc.state ? Colors.grey : Colors.blue,
          onPressed: () => toggleBloc.add(true),
        ),
        MaterialButton(
          child: Text('Button 2'),
          color: !toggleBloc.state ? Colors.grey : Colors.blue,
          onPressed: () => toggleBloc.add(false),
        ),
      ],
    );
  }
}

class ToggleBloc extends Bloc<bool, bool> {
  ToggleBloc() : super(false){
    on<bool>(toggleButtons);
  }

  FutureOr<void> toggleButtons(bool event, Emitter<bool> emit) {
    emit(!state);
  }
}
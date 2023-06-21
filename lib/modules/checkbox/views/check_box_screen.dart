import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxScreen extends StatefulWidget {
  const CheckBoxScreen({Key? key}) : super(key: key);

  @override
  State<CheckBoxScreen> createState() => _CheckBoxScreenState();
}

class _CheckBoxScreenState extends State<CheckBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Example'),
      ),
      body: BlocProvider(
        create: (context) => CheckboxBloc(),
        child: CheckboxPageContent(),
      ),
    );
  }
}
class CheckboxPageContent extends StatelessWidget {
  const CheckboxPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final checkboxBloc = BlocProvider.of<CheckboxBloc>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CheckboxBloc, CheckboxState>(
            builder: (context, state) {
              return Checkbox(
                value: state.isChecked,
                onChanged: (bool? value) {
                  checkboxBloc.add(ToggleCheckboxEvent());
                },
              );
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text('Next Page'),
            onPressed: () {
              final state = checkboxBloc.state;
              if (state.isChecked) {
                // Navigate to the next page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('You have navigated to the next page.'),
      ),
    );
  }
}


// Define the events
abstract class CheckboxEvent {}

class ToggleCheckboxEvent extends CheckboxEvent {}

// Define the state
class CheckboxState {
  final bool isChecked;

  CheckboxState(this.isChecked);
}

// Define the BLoC
class CheckboxBloc extends Bloc<CheckboxEvent, CheckboxState> {
  CheckboxBloc() : super(CheckboxState(false)){
    on<ToggleCheckboxEvent>(toggleCheckBox);
  }

  FutureOr<void> toggleCheckBox(ToggleCheckboxEvent event, Emitter<CheckboxState> emit) {
    emit(CheckboxState(!state.isChecked));
  }
}

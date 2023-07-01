import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/core/app/functions.dart';
import 'package:locations_work/modules/checkbox/widgets/offer_widget.dart';
class CheckBoxScreen extends StatefulWidget {
  const CheckBoxScreen({Key? key}) : super(key: key);

  @override
  State<CheckBoxScreen> createState() => _CheckBoxScreenState();
}

class _CheckBoxScreenState extends State<CheckBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Example'),
      ),
      body: BlocProvider(
        create: (context) => CheckboxBloc(),
        child: const CheckboxPageContent(),
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
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
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
            Row(
              children: [
                const Icon(Icons.ac_unit_outlined),
                const SizedBox(width: 10),
                const Text(
                        'fafadfadfjadfklajdf;alkdjf jaldjfal;djf fasdkfja;dkjf  fsdfjadfl;j fadfafdadfsda')
                    .responsive(),
              ],
            ),
            const SizedBox(height: 20),
            const OfferWidget(
              contentWidget:  Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  Icon(
                    Icons.add_alert_sharp,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.add_alert_sharp,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.add_alert_sharp,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.add_alert_sharp,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.add_alert_sharp,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.add_alert_sharp,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.add_alert_sharp,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.add_alert_sharp,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.add_alert_sharp,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.add_alert_sharp,
                    size: 50,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Next Page'),
              onPressed: () {
                final state = checkboxBloc.state;
                if (state.isChecked) {
                  // Navigate to the next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NextPage()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: const Center(
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
  CheckboxBloc() : super(CheckboxState(false)) {
    on<ToggleCheckboxEvent>(toggleCheckBox);
  }

  FutureOr<void> toggleCheckBox(
      ToggleCheckboxEvent event, Emitter<CheckboxState> emit) {
    emit(CheckboxState(!state.isChecked));
  }
}

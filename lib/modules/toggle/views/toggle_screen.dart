import 'package:flutter/material.dart' hide ToggleButtons;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/modules/containers/widget/toggle_buttons.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toggle Buttons')),
      body: BlocProvider(
        create: (context) => ToggleBloc(),
        child: BlocBuilder<ToggleBloc, bool>(
  builder: (context, state) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: ToggleButtons()),
            const SizedBox(height: 20),
            MaterialButton(
              child: Text('Go to Other Screen'),
              onPressed: () {
                final toggleBloc = BlocProvider.of<ToggleBloc>(context);
                Navigator.push(context,MaterialPageRoute(builder: (context)=>OtherScreen(myState: toggleBloc.state,)));
                // Navigator.of(context).pushNamed(
                //   '/other',
                //   arguments: toggleBloc.state,
                // );
              },
            ),
          ],
        );
  },
),
      ),
    );
  }
}
class OtherScreen extends StatelessWidget {
  final bool myState;

  const OtherScreen({super.key, required this.myState});
  @override
  Widget build(BuildContext context) {
    // final Object? isButton1Selected = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(title: const Text('Other Screen')),
      body: Center(
        child: Text(
          'Selected button: ${myState ? "Button 1" : "Button 2"}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

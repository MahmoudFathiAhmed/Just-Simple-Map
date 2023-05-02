import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/core/helpers/service_locator.dart';
import 'package:locations_work/modules/translation/bloc/trans_bloc/bloc/trans_bloc.dart';

class TransScreen extends StatelessWidget {
  const TransScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => TransBloc(getIt.get())..add(GetTrans()),
        child: Center(child: BlocBuilder<TransBloc, TransState>(
          builder: (context, transState) {
            // String language= getIt<AppPreferences>().getAppLanguage();
            if (transState is TransLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (transState is TransErrorState) {
              return const Center(child: Text('something went wrong'));
            } else if (transState is TransSuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('''
                    response: 
                    {
                      "englishText": "Hello",
                      "arabicText": "مرحبا" 
                    }
''',
style: TextStyle(backgroundColor: Colors.blue.withOpacity(0.01)),
),
                  Text('English: ${transState.transResponse.englishText}'),
                  Text('عربــي: ${transState.transResponse.arabicText}'),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        )),
      ),
    );
  }
}

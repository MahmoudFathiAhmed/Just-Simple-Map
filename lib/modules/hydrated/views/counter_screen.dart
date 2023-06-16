import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/modules/hydrated/bloc/counter_bloc.dart';
import 'package:locations_work/modules/hydrated/cubit/brightness_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter With Hydrated Bloc'),),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (counterContext, counterState) {
            if (counterState.status == CounterStatus.initial ||
                counterState.status == CounterStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (counterState.status == CounterStatus.success) {
              return Center(
                child: Text(
                    'The Counter value is: ${counterState.counter.value}'),
              );
            }
            else {
              return const Text('Something Went Wrong');
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 'counter_add',
              child: const Icon(Icons.add),
              onPressed: () {
                context.read<CounterBloc>().add(CounterIncrementPressed());
              }),
          const SizedBox(height: 10,),
          FloatingActionButton(
              heroTag: 'counter_remove',
              child: const Icon(Icons.remove),
              onPressed: () {
                context.read<CounterBloc>().add(CounterDecrementPressed());
              }),const SizedBox(height: 10,),
          FloatingActionButton(
              heroTag: 'brightness_toggle',
              child: const Icon(Icons.light),
              onPressed: () {
                context.read<BrightnessCubit>().toggleBrightness();
              }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DefaultExpandableWidget extends StatelessWidget {
  final String headerText;
  final Widget content;
  const DefaultExpandableWidget({Key? key, required this.headerText, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpansionPanelBloc(),
      child: BlocBuilder<ExpansionPanelBloc, ExpansionPanelState>(
        builder: (expansionPanelContext, expansionPanelState) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  expansionPanelContext.read<ExpansionPanelBloc>().add(ToggleExpansionEvent());
                },
                child: Container(
                  height: 79,
                  padding: const EdgeInsets.all(20.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(headerText),
                      expansionPanelState.isExpanded ==false? const Icon(Icons.arrow_downward_sharp):const Icon(Icons.arrow_upward_sharp),
                    ],
                  ),
                ),
              ),
              expansionPanelState.isExpanded ==true ?
              Container(
                // height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    left:BorderSide(color: Colors.grey),
                    bottom:BorderSide(color: Colors.grey),
                    right:BorderSide(color: Colors.grey),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: content,
                ),
              ):const SizedBox()
            ],
          );
        },
      ),
    );
  }
}
class ExpansionPanelBloc
    extends Bloc<ExpansionPanelEvent, ExpansionPanelState> {
  ExpansionPanelBloc() : super(const ExpansionPanelState(isExpanded: false)) {
    on<ExpansionPanelEvent>((event, emit) => expand(emit));
  }

  expand(Emitter<ExpansionPanelState> emit) {
    emit(state.copyWith(isExpanded: !state.isExpanded));
  }

// void _expand(ExpansionPanelEvent event, Emitter<ExpansionPanelState> emit) {
//   emit(state.copyWith(isExpanded: !state.isExpanded));
// }
}

@immutable
class ExpansionPanelState {
  final bool isExpanded;

  const ExpansionPanelState({required this.isExpanded});

  ExpansionPanelState copyWith({bool? isExpanded}) {
    return ExpansionPanelState(isExpanded: isExpanded ?? this.isExpanded);
  }
}

abstract class ExpansionPanelEvent {}

class ToggleExpansionEvent extends ExpansionPanelEvent {}

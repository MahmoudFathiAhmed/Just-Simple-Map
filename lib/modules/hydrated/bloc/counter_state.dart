part of 'counter_bloc.dart';

enum CounterStatus { initial, loading, success, error }

class CounterState extends Equatable {
  final Counter counter;
  final CounterStatus status;

  const CounterState(
      {this.counter = const Counter(),
      this.status = CounterStatus.initial});

  factory CounterState.fromJson(Map<String, dynamic> json) {
    return CounterState(
        counter: Counter.fromJson(
          json['counter'],
        ),
        status: CounterStatus.values.firstWhere(
            (element) => element.name.toString() == json['status']));
  }

  Map<String, dynamic> toJson() {
    return {
      'counter': counter.toJson(),
      'status': status.name
    };
  }

  @override
  List<Object> get props => [counter, status];
}

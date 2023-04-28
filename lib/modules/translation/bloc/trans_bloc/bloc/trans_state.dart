part of 'trans_bloc.dart';

abstract class TransState extends Equatable {
  const TransState();
  
  @override
  List<Object> get props => [];
}

class TransInitial extends TransState {}

class TransSuccessState extends TransState {
  final TransResponse transResponse;

  const TransSuccessState(this.transResponse);

  @override
  List<Object> get props => [transResponse];
}

class TransLoadingState extends TransState {}

class TransErrorState extends TransState {
  final String error;

  const TransErrorState(this.error);
  @override
  List<Object> get props => [error];
}

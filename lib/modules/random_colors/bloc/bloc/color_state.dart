part of 'color_bloc.dart';

abstract class ColorState extends Equatable {
  const ColorState();
  
  @override
  List<Object> get props => [];
}

class ColorInitial extends ColorState {}

class ColorGeneratedState extends ColorState {
  final Color color;

  const ColorGeneratedState({required this.color});

  @override
  List<Object> get props => [color];
}

import 'dart:async';
import 'dart:math';


import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorInitial()){
    on<GenerateColorEvent>(generateRandomColor);
  }
  FutureOr<void> generateRandomColor(GenerateColorEvent event, Emitter<ColorState> emit){

      final random = Random();
      final color = Color.fromARGB(
        255,
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
      );
      emit(ColorGeneratedState(color: color));

  }
  }


// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:locations_work/core/routes/functions.dart';

import 'package:locations_work/modules/datetime2/repository/datetime2_repository.dart';

part 'get_availability_event.dart';

part 'get_availability_state.dart';

class GetAvailabilityBloc
    extends Bloc<GetAvailabilityEvent, GetAvailabilityState> {
  DateTime2Repository dateTime2Repository;

  GetAvailabilityBloc(
    this.dateTime2Repository,
  ) : super(GetAvailabilityInitial()) {
    on<GetWaitingEvent>(getWaiting);
  }

  FutureOr<void> getWaiting(
      GetWaitingEvent event, Emitter<GetAvailabilityState> emit) async {
    emit(GetAvailabilityLoadingState());
    await dateTime2Repository
        .getWaiting2()
        // .getWaiting()
        .then((result) => result.fold((error) {
              emit(GetAvailabilityErrorState(error.message));
            }, (response) async {
      final now = DateTime.now();
      final year = now.year;
      final month = DateTime.now().month.addLeadingZero();
      final day = DateTime.now().day.addLeadingZero();
              List<DateTime> notAvailable = response
                  .where((element) => element.isAvailable == false)
                  .map((e) => DateTime.parse('$year-$month-$day ${e.time}').toLocal())
                  .toList();
                print(notAvailable);
              // final dates = response.result!
              //     .where((element) => element.ordersExist == true)
              //     .map((entry) {
              //   final year = DateTime.now().year;
              //   final month = DateTime.now().month;
              //   final day = entry.day;
              //   final hour = entry.hour;
              //   debugPrint('year: $year, month: $month, day: $day, hour: $hour');
              //   return DateTime(year, month, day!, hour!);
              // }).toList();
              emit(GetAvailabilitySuccessState(notAvailable));
            }));
  }
}

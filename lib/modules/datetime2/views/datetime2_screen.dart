import 'package:date_picker_timetable/date_picker_timetable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/core/app/components.dart';
import 'package:locations_work/core/helpers/service_locator.dart';
import 'package:locations_work/core/app/functions.dart';
import 'package:locations_work/modules/datetime2/bloc/get_availability_bloc/get_availability_bloc.dart';
import 'package:locations_work/modules/datetime2/bloc/selected_button_bloc/bloc/selected_button_bloc.dart';
import 'package:locations_work/modules/datetime2/bloc/selected_minutes_button_bloc/bloc/selected_minutes_button_bloc.dart';
import 'package:locations_work/modules/datetime2/bloc/time_picker_bloc/time_picker_bloc.dart';
import 'package:locations_work/modules/datetime2/widgets/hour_button_widget.dart';
import 'package:locations_work/modules/datetime2/widgets/minutes_button_widget.dart';

class DateTime2Screen extends StatelessWidget {
  const DateTime2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    List<DateTime> allHoursList = [];
    List<DateTime> notAvailable = [];
    DateTime selectedIndex = DateTime.now().subtract(const Duration(days: 3));
    String finalDateSelected = '';
    bool isWaiting = false;
    return MultiBlocProvider(
      providers: [
        BlocProvider<TimePickerBloc>.value(
          value: TimePickerBloc(),
        ),
        BlocProvider(
          create: (context) =>
              GetAvailabilityBloc(getIt.get())..add(GetWaitingEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<GetAvailabilityBloc, GetAvailabilityState>(
            builder: (waitingContext, waitingState) {
              if (waitingState is GetAvailabilitySuccessState) {
                notAvailable = waitingState.notAvailabileList;
                debugPrint('[[[[[[[[[[[$notAvailable]]]]]]]]]]]');
              }
              return BlocProvider(
                create: (context) => SelectedMinutesButtonBloc(),
                child: BlocBuilder<SelectedMinutesButtonBloc,
                    SelectedMinutesButtonState>(
                  builder: (selectedMinutesButtonContext,
                      selectedMinutesButtonState) {
                    return BlocBuilder<TimePickerBloc, DaySelectedState>(
                      builder: (timePickerContext, timePickerState) {
                        allHoursList = timePickerState.hours;
                        return Column(
                          children: [
                            DatePicker(
                              DateTime.now().toLocal(),
                              height: 90,
                              width: 70,
                              initialSelectedDate: DateTime.now().toLocal(),
                              selectionColor: Colors.blue,
                              selectedTextColor: Colors.white,
                              deactivatedColor: Colors.grey.shade400,
                              daysCount: 4,
                              inactiveDates: [
                                DateTime.now()
                                    .add(const Duration(days: 3))
                                    .toLocal()
                              ],
                              onDateChange: (day) {
                                timePickerContext
                                    .read<TimePickerBloc>()
                                    .add(DaySelectedEvent(day));
                              },
                            ),
                            waitingState is GetAvailabilityLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : waitingState is GetAvailabilitySuccessState
                                    ? RefreshIndicator(
                                        onRefresh: () async {
                                          await Future.delayed(
                                              const Duration(seconds: 1), () {
                                            waitingContext
                                                .read<GetAvailabilityBloc>()
                                                .add(GetWaitingEvent());
                                          });
                                        },
                                        child: SingleChildScrollView(
                                          physics:
                                              const AlwaysScrollableScrollPhysics(
                                                  parent:
                                                      BouncingScrollPhysics()),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: MySpecialMagicGridView(
                                            alignment: WrapAlignment.start,
                                            spacing: 10,
                                            runSpacing: 10,
                                            listCount: allHoursList.length,
                                            generatedWidget: (index) {
                                              List<DateTime> minutesList =
                                                  allHoursList[index]
                                                      .getFifteenMinutesIntervals();
                                              return HourButtonWidget(
                                                hour: allHoursList[index],
                                                color: hourButtonColor(
                                                    myDate: allHoursList[index],
                                                    selectedDate:
                                                        selectedIndex),
                                                availabilityColor:
                                                    hourAvailableColor(
                                                        myDate:
                                                            allHoursList[index],
                                                        notAvailable:
                                                            notAvailable),
                                                onTap:
                                                    isImpossibleToMakeOrder(
                                                            time: allHoursList[
                                                                index])
                                                        ? null
                                                        : () {
                                                            debugPrint(
                                                                '****** ${isImpossibleToMakeOrder(time: allHoursList[index])} ******');
                                                            debugPrint(
                                                                '*****${allHoursList[index]}');
                                                            showModalBottomSheet(
                                                              elevation: 10,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              useSafeArea: true,
                                                              context: context,
                                                              builder: (ctx) {
                                                                return BlocProvider(
                                                                  create: (context) =>
                                                                      SelectedButtonBloc(),
                                                                  child: BlocBuilder<
                                                                      SelectedButtonBloc,
                                                                      SelectedButtonState>(
                                                                    builder:
                                                                        (selectedButtonContext,
                                                                            selectedButtonState) {
                                                                      if (selectedButtonState
                                                                          is SelectedButtonUpdatedState) {
                                                                        selectedIndex =
                                                                            selectedButtonState.date;
                                                                        isNotAvailable(date: selectedIndex, notAvailable: notAvailable)
                                                                            ? isWaiting =
                                                                                true
                                                                            : isWaiting =
                                                                                false;
                                                                      }
                                                                      return SizedBox(
                                                                        height:
                                                                            200,
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(20.0),
                                                                              child: MySpecialMagicGridView(
                                                                                listCount: minutesList.length,
                                                                                spacing: 10,
                                                                                generatedWidget: (index) {
                                                                                  return MinutesButtonWidget(
                                                                                      hour: minutesList[index],
                                                                                      buttonColor: isImpossibleToMakeOrder2(time: minutesList[index])
                                                                                          ? Colors.grey.shade300
                                                                                          : selectedIndex == minutesList[index]
                                                                                              ? Colors.blue
                                                                                              : Colors.white,
                                                                                      // selected: selectedIndex == minutesList[index],
                                                                                      availabilityColor: minutesAvailableColor(myDate: minutesList[index], notAvailable: notAvailable),
                                                                                      onTap: isImpossibleToMakeOrder2(time: minutesList[index])
                                                                                          ? null
                                                                                          : () {
                                                                                              debugPrint('****** ${isImpossibleToMakeOrder2(time: minutesList[index])} ******');
                                                                                              selectedButtonContext.read<SelectedButtonBloc>().add(SelectedButtonChangedEvent(minutesList[index]));
                                                                                              selectedMinutesButtonContext.read<SelectedMinutesButtonBloc>().add(SelectMinutesButtonEvent(minutesList[index]));
                                                                                              finalDateSelected = minutesList[index].toString();
                                                                                              debugPrint('*&^% Hour Selected: ${minutesList[index]} ');
                                                                                            });
                                                                                },
                                                                              ),
                                                                            ),
                                                                            const SizedBox(height: 10),
                                                                            ElevatedButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: const Text('cancel'))
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                              );
                                            },
                                          ),
                                        ))
                                    : const Center(
                                        child: CircularProgressIndicator()),
                            Text(finalDateSelected),
                            Text('$isWaiting')
                          ],
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

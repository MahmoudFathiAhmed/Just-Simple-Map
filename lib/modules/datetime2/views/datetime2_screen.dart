// import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timetable/date_picker_timetable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/core/helpers/service_locator.dart';
import 'package:locations_work/core/routes/functions.dart';
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
    int? selectedIndex;
    String finalDateSelected = '';
    String nnnn = '';
    DateTime? mm;

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
            builder: (context, waitingState) {
              if (waitingState is GetAvailabilitySuccessState) {
                notAvailable = waitingState.notAvailabileList;
                debugPrint('[[[[[[[[[[[$notAvailable]]]]]]]]]]]');
              }
              return Column(
                children: [
                  BlocBuilder<TimePickerBloc, TimePickerState>(
                    builder: (context, timePickerState) {
                      if (timePickerState is DaySelectedState) {
                        allHoursList = timePickerState.hours;
                      }
                      return DatePicker(
                        DateTime.now().toLocal(),
                        height: 90,
                        width: 70,
                        initialSelectedDate: DateTime.now().toLocal(),
                        selectionColor: Colors.blue,
                        selectedTextColor: Colors.white,
                        deactivatedColor: Colors.grey.shade400,
                        daysCount: 4,
                        inactiveDates: [
                          DateTime.now().add(const Duration(days: 3)).toLocal()
                        ],
                        onDateChange: (day) {
                          context
                              .read<GetAvailabilityBloc>()
                              .add(GetWaitingEvent());
                          context
                              .read<TimePickerBloc>()
                              .add(DaySelectedEvent(day));
                        },
                      );
                    },
                  ),
                  waitingState is GetAvailabilityLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : RefreshIndicator(
                          onRefresh: () async {
                            await Future.delayed(const Duration(seconds: 1),
                                () {
                              context
                                  .read<GetAvailabilityBloc>()
                                  .add(GetWaitingEvent());
                            });
                          },
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                crossAxisCount: 4,
                                mainAxisExtent: 50,
                                mainAxisSpacing: 10,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              physics: const AlwaysScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics()),
                              shrinkWrap: true,
                              itemCount: allHoursList.length,
                              itemBuilder: (context, index) {
                                List<DateTime> x = allHoursList[index]
                                    .getFifteenMinutesIntervals();
                                return HourButtonWidget(
                                  hour: allHoursList[index],
                                  color: isImpossibleToMakeOrder(
                                          time: allHoursList[index])
                                      ? Colors.grey.shade300
                                      : Colors.white,
                                  availabilityColor: isImpossibleToMakeOrder(
                                          time: allHoursList[index])
                                      ? Colors.grey.shade300
                                      : notAvailable
                                              .contains(allHoursList[index])
                                          ? Colors.orange
                                          : Colors.blue,
                                  onTap:
                                      isImpossibleToMakeOrder(
                                              time: allHoursList[index])
                                          ? null
                                          : () {
                                              debugPrint(
                                                  '*****${allHoursList[index]}');
                                              context
                                                  .read<TimePickerBloc>()
                                                  .add(HourSelectedEvent(
                                                      allHoursList[index]));
                                              showModalBottomSheet(
                                                elevation: 10,
                                                backgroundColor: Colors.white,
                                                context: context,
                                                builder: (ctx) {
                                                  return BlocProvider(
                                                    create: (context) =>
                                                        SelectedButtonBloc(),
                                                    child: BlocBuilder<
                                                        SelectedButtonBloc,
                                                        SelectedButtonState>(
                                                      builder: (context,
                                                          selectedButtonState) {
                                                        if (selectedButtonState
                                                            is SelectedButtonUpdatedState) {
                                                          selectedIndex =
                                                              selectedButtonState
                                                                  .index;
                                                        }
                                                        return SizedBox(
                                                          height: 200,
                                                          child: BlocProvider(
                                                            create: (context) =>
                                                                SelectedMinutesButtonBloc(),
                                                            child: BlocConsumer<
                                                                SelectedMinutesButtonBloc,
                                                                SelectedMinutesButtonState>(
                                                              listener: (context,
                                                                  selectedMinutesButtonState) {
                                                                if (selectedMinutesButtonState
                                                                    is SelectMinutesButtonState) {
                                                                  nnnn = selectedMinutesButtonState
                                                                      .hourWithMinutes
                                                                      .toString();
                                                                  mm = selectedMinutesButtonState
                                                                      .hourWithMinutes;
                                                                }
                                                              },
                                                              builder: (context,
                                                                  selectedMinutesButtonState) {
                                                                return ListView
                                                                    .builder(
                                                                  physics:
                                                                      const BouncingScrollPhysics(),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  itemCount:
                                                                      x.length,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(10),
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return MinutesButtonWidget(
                                                                        hour: x[
                                                                            index],
                                                                        selected:
                                                                            selectedIndex ==
                                                                                index,
                                                                        availabilityColor:
                                                                            Colors
                                                                                .blue,
                                                                        onTap:
                                                                            () {
                                                                          finalDateSelected =
                                                                              x[index].toString();
                                                                          // context
                                                                          //     .read<SelectedButtonBloc>()
                                                                          //     .add(SelectedButtonChangedEvent(index));
                                                                          context
                                                                              .read<SelectedMinutesButtonBloc>()
                                                                              .add(SelectMinutesButtonEvent(x[index]));
                                                                          finalDateSelected =
                                                                              x[index].toString();
                                                                          selectedIndex =
                                                                              index;
                                                                          debugPrint(
                                                                              '*&^% Hour Selected: ${x[index]} ');
                                                                          // Navigator.pop(context, true);
                                                                        });
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ).whenComplete(() {
                                                selectedIndex = -1;
                                                print(nnnn);
                                              });
                                            },
                                );
                              }),
                        ),
                  mm != null ? Text(mm.toString()) : const SizedBox(),
                  Text(finalDateSelected)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

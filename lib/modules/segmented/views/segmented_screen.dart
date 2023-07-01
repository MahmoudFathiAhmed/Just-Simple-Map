import 'package:flutter/material.dart';
enum Calendar { day, week, month, year }
enum Sizes { extraSmall, small, medium, large, extraLarge }
class SegmentedScreen extends StatefulWidget {
  const SegmentedScreen({super.key});

  @override
  State<SegmentedScreen> createState() => _SegmentedScreenState();
}

class _SegmentedScreenState extends State<SegmentedScreen> {
  Calendar calendarView = Calendar.day;
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SegmentedButton<Calendar>(
                  segments: const <ButtonSegment<Calendar>>[
                    ButtonSegment<Calendar>(
                        value: Calendar.day,
                        label: Text('Day'),
                        icon: Icon(Icons.calendar_view_day)),
                    ButtonSegment<Calendar>(
                        value: Calendar.week,
                        label: Text('Week'),
                        icon: Icon(Icons.calendar_view_week)),
                    ButtonSegment<Calendar>(
                        value: Calendar.month,
                        label: Text('Month'),
                        icon: Icon(Icons.calendar_view_month)),
                    ButtonSegment<Calendar>(
                        value: Calendar.year,
                        label: Text('Year'),
                        icon: Icon(Icons.calendar_today)),
                  ],
                  selected: <Calendar>{calendarView},
                  onSelectionChanged: (Set<Calendar> newSelection) {
                    setState(() {
                      // By default there is only a single segment that can be
                      // selected at one time, so its value is always the first
                      // item in the selected set.
                      calendarView = newSelection.first;
                    });
                  },
                ),
                SizedBox(height: 20),
                SegmentedButton<Sizes>(
                  segments: const <ButtonSegment<Sizes>>[
                    ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
                    ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
                    ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
                    ButtonSegment<Sizes>(
                      value: Sizes.large,
                      label: Text('L'),
                    ),
                    ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
                  ],
                  selected: selection,
                  onSelectionChanged: (Set<Sizes> newSelection) {
                    setState(() {
                      selection = newSelection;
                    });
                  },
                  multiSelectionEnabled: true,
                ),
                SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    Stack(
                      //alignment:Alignment.bottomRight = Position(right:0,bottom:0)
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.red.withOpacity(.5),
                        ),
                        const Positioned(
                          bottom: 0,
                          right: 0,
                          child: Icon(
                            Icons.verified_sharp,
                            size: 30,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.indigo.withOpacity(.5),
                        child: const Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child:Icon(
                                  Icons.verified_sharp,
                                  size: 30,
                                  color: Colors.lightBlue,
                                ),
                              )
                            ]
                        )
                    ),
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    ),);
  }
}

import 'package:flutter/material.dart';
class DateTestScreen extends StatefulWidget {
  const DateTestScreen({Key? key}) : super(key: key);

  @override
  State<DateTestScreen> createState() => _DateTestScreenState();
}

class _DateTestScreenState extends State<DateTestScreen> {
  String? _selectedTime;
  DateTime? selectedTime;
  DateTime now = DateTime.now();
  Color selectedColor = Colors.blue;

  Future<void> _show() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        debugPrint('${DateTime.now()}');
/*
لو الفارق بين الوقت دلوقتي و وقت الاوردر ساعه او اقل اعمل disable
DateTime.now().difference(orderTime.local()).inMinutes <=60:false:true
* */
        selectedTime =
            DateTime(now.year, now.month, now.day, result.hour, result.minute);
        debugPrint('$selectedTime');
        debugPrint('${DateTime.now()
            .difference(selectedTime!)
            .inMinutes}');
        if (DateTime.now()
                .difference(selectedTime!)
                .inMinutes <=
            60) {
          selectedColor = Colors.orange;
        } else {
          selectedColor = Colors.blue;
        }
        _selectedTime = result.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: ElevatedButton(
          onPressed: _show, child: const Text('Show Time Picker')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              _selectedTime != null ? _selectedTime! : 'No time selected!',
              style: const TextStyle(fontSize: 30),
            ),
          ),
          CircleAvatar(
            backgroundColor: selectedColor,
          )
        ],
      ),
    );
  }
}

//15. Create an app where the user can pick a date and a time. Display the selected date and time on the screen.


import 'package:flutter/material.dart';

void main() {
  runApp(DateTimePickerApp());
}

class DateTimePickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date & Time Picker',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: DateTimePickerScreen(),
    );
  }
}

class DateTimePickerScreen extends StatefulWidget {
  @override
  _DateTimePickerScreenState createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() => selectedDate = date);
    }
  }

  Future<void> _pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (time != null) {
      setState(() => selectedTime = time);
    }
  }

  @override
  Widget build(BuildContext context) {
    String dateText = selectedDate == null
        ? 'No date selected'
        : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}';

    String timeText = selectedTime == null
        ? 'No time selected'
        : selectedTime!.format(context);

    return Scaffold(
      appBar: AppBar(title: Text('Date & Time Picker')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Selected Date: $dateText', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickDate,
                child: Text('Select a Date'),
              ),
              SizedBox(height: 30),
              Text('Selected Time: $timeText', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickTime,
                child: Text('Select a Time'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Selected Date: $dateText\nSelected Time: $timeText'),
            ),
          );
        },
        child: Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

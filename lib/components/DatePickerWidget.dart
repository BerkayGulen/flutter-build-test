import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  final String title;
  const DatePickerWidget({Key? key, required this.title}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(widget.title),
        TextButton(
          onPressed: () => _selectDate(context),
          child: Text('Select date'),
        ),
        Text('Selected date: ${selectedDate.toString()}'),
      ],
    );
  }
}

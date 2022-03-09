import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  const DatePicker({
    required this.selectedDate,
    required this.onDateChanged,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021, 9, 21),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _showDatePicker(context),
      icon: Icon(
        Icons.date_range,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

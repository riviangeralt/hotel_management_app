import 'package:flutter/material.dart';

Future<void> showDatePickerPopup({
  required BuildContext context,
  required DateTime? selectedDate,
  Function(DateTime? date)? onDatePick,
}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101),
  );
  if (picked != null && picked != selectedDate) {
    onDatePick!(picked);
  }
}

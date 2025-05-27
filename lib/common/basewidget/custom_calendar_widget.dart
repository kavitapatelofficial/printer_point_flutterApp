import 'package:flutter/material.dart';

class CustomCalendarWidget extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final Function(DateTime? startDate, DateTime? endDate) onSubmit;

  const CustomCalendarWidget({super.key, required this.onSubmit, this.startDate, this.endDate});

  @override
  State<CustomCalendarWidget> createState() => _CustomCalendarWidgetState();
}

class _CustomCalendarWidgetState extends State<CustomCalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTimeRange? pickedRange = await showDateRangePicker(
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          initialDateRange: widget.startDate != null && widget.endDate != null
              ? DateTimeRange(start: widget.startDate!, end: widget.endDate!)
              : null,
        );

        if (pickedRange != null) {
          widget.onSubmit(pickedRange.start, pickedRange.end);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.startDate != null && widget.endDate != null
              ? "${widget.startDate!.toLocal()} - ${widget.endDate!.toLocal()}"
              : "Select Date Range",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

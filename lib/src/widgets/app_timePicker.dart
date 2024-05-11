import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomizableTimePicker extends StatefulWidget {
  final String title;
  final Function(TimeOfDay) onTimeSelected;
  final Color backgroundColor;
  final Color buttonColor;
  final Color selectedColor;
  final Color todayColor;
  final Color textColor;
  const CustomizableTimePicker({
    Key? key,
    required this.title,
    required this.onTimeSelected,
    required this.backgroundColor,
    required this.buttonColor,
    required this.selectedColor,
    required this.todayColor,
    required this.textColor,
  }) : super(key: key);
  @override
  _CustomizableTimePickerState createState() => _CustomizableTimePickerState();
}
class _CustomizableTimePickerState extends State<CustomizableTimePicker> {
  late TimeOfDay _selectedTime;
  late DateFormat _timeFormat;
  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
    _timeFormat = DateFormat('HH:mm');
  }
  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        widget.onTimeSelected(picked);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _selectTime(context);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              border: Border.all(
                color: widget.buttonColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _timeFormat.format(DateTime(0, 0, 0, _selectedTime.hour, _selectedTime.minute)),
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.access_time,
                  color: widget.buttonColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
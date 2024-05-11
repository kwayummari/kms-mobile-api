import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomizableDatePicker extends StatefulWidget {
  final String title;
  final Function(DateTime) onDateSelected;
  final Color backgroundColor;
  final Color buttonColor;
  final Color selectedColor;
  final Color todayColor;
  final Color textColor;

  const CustomizableDatePicker({
    Key? key,
    required this.title,
    required this.onDateSelected,
    required this.backgroundColor,
    required this.buttonColor,
    required this.selectedColor,
    required this.todayColor,
    required this.textColor,
  }) : super(key: key);

  @override
  _CustomizableDatePickerState createState() => _CustomizableDatePickerState();
}

class _CustomizableDatePickerState extends State<CustomizableDatePicker> {
  late DateTime _selectedDate;
  late DateFormat _dateFormat;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now().toLocal();
    _selectedDate = DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day);
    _dateFormat = DateFormat('dd/MM/yyyy');
  }


  void _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(now.year, 12, 31),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.onDateSelected(picked);
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
            _selectDate(context);
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
                  _dateFormat.format(_selectedDate),
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.calendar_today,
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

import 'package:gugu/src/gateway/dropdown-service.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:flutter/material.dart';

class DropdownTextFormField extends StatefulWidget {
  final String labelText;
  final Icon? icon;
  final Color? fillcolor;
  final IconButton? suffixicon;
  final String apiUrl;
  final String valueField;
  final String displayField;
  final void Function(String?)? onChanged;

  DropdownTextFormField({
    required this.labelText,
    this.icon,
    this.suffixicon,
    required this.fillcolor,
    required this.apiUrl,
    required this.valueField,
    required this.displayField,
    this.onChanged,
  });

  @override
  State<DropdownTextFormField> createState() => _DropdownTextFormFieldState();
}

class _DropdownTextFormFieldState extends State<DropdownTextFormField> {
  Future<List<DropdownMenuItem<String>>> _getItems() async {
    final dropdownService _dropdownService = await dropdownService();
    final data = await _dropdownService.dropdown(context, widget.apiUrl);
    return data
        .map<DropdownMenuItem<String>>((item) => DropdownMenuItem(
              value: item[widget.valueField].toString(),
              child: Text(item[widget.displayField]),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getItems(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data;
          if (items!.isNotEmpty) {
            return DropdownButtonFormField(
              decoration: InputDecoration(
                enabled: true,
                labelStyle: TextStyle(
                  color: AppConst.white,
                  fontFamily: 'OpenSans',
                ),
                labelText: widget.labelText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                filled: true,
                fillColor: widget.fillcolor,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: AppConst.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: AppConst.black),
                ),
                prefixIcon: widget.icon,
                suffixIcon: widget.suffixicon,
              ),
              items: snapshot.data,
              onChanged: widget.onChanged,
            );
          } else {
            return Text('No items found');
          }
        } else if (snapshot.hasError) {
          return Text('Failed to fetch items');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

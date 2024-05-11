import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppDropdownTextFormField extends StatelessWidget {
  final String labelText;
  final List<String> options;
  final String value;
  final void Function(String?)? onChanged;

  AppDropdownTextFormField({
    required this.labelText,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppConst.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: AppConst.primary),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            hint: AppText(
              txt: labelText,
              color: AppConst.black,
              size: 15,
            ),
            isDense: true,
            onChanged: onChanged,
            items: [
              ...options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: AppText(
                    txt: option,
                    size: 15,
                    color: AppConst.black,
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

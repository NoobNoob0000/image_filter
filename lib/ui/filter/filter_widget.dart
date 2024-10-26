import 'package:flutter/material.dart';
import 'package:image_filter/core/index.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.value,
    required this.text,
    required this.groupValue,
    required this.onChanged,
  });

  final String value;
  final String text;
  final String groupValue;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(
        text == ' ' ? 'All' : text,
        style: AppTextStyle.content(context),
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}

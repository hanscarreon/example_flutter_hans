import 'package:flutter/material.dart';

class AppInputWidget extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? forceErrorText;
  final Function(String value)? onChanged;
  final TextEditingController? textEditingController;
  final Key? fieldKey;
  const AppInputWidget({
    super.key,
    required this.label,
    this.hintText,
    this.forceErrorText,
    this.onChanged,
    this.textEditingController,
    this.fieldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextFormField(
          key: fieldKey,
          forceErrorText: forceErrorText,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          onChanged: onChanged,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'sign_up_line_field.dart';

class SignUpPhoneField extends StatelessWidget {
  const SignUpPhoneField({
    super.key,
    this.initialValue,
    this.onChanged,
    this.errorText,
    this.enabled = true,
  });

  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SignUpLineField(
      label: 'Phone Number',
      hintText: '+1 000 000 0000',
      initialValue: initialValue,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      errorText: errorText,
      enabled: enabled,
    );
  }
}

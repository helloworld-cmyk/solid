import 'package:flutter/material.dart';

import 'sign_in_line_field.dart';

class SignInEmailField extends StatelessWidget {
  const SignInEmailField({
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
    return SignInLineField(
      label: 'Email',
      initialValue: initialValue,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      errorText: errorText,
      enabled: enabled,
    );
  }
}

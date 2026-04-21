import 'package:flutter/material.dart';

import 'sign_up_line_field.dart';

class SignUpNameRow extends StatelessWidget {
  const SignUpNameRow({
    super.key,
    this.firstNameInitialValue,
    this.lastNameInitialValue,
    this.firstNameErrorText,
    this.lastNameErrorText,
    this.enabled = true,
    this.onFirstNameChanged,
    this.onLastNameChanged,
  });

  final String? firstNameInitialValue;
  final String? lastNameInitialValue;
  final String? firstNameErrorText;
  final String? lastNameErrorText;
  final bool enabled;
  final ValueChanged<String>? onFirstNameChanged;
  final ValueChanged<String>? onLastNameChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SignUpLineField(
            hintText: 'First name',
            initialValue: firstNameInitialValue,
            onChanged: onFirstNameChanged,
            errorText: firstNameErrorText,
            enabled: enabled,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: SignUpLineField(
            hintText: 'Last name',
            initialValue: lastNameInitialValue,
            onChanged: onLastNameChanged,
            errorText: lastNameErrorText,
            enabled: enabled,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
          ),
        ),
      ],
    );
  }
}

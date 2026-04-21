import 'package:flutter/material.dart';

import 'sign_up_line_field.dart';

class SignUpPasswordField extends StatelessWidget {
  const SignUpPasswordField({
    super.key,
    required this.label,
    this.textInputAction = TextInputAction.next,
    this.enabled = true,
    this.obscureText = true,
    this.onToggleVisibility,
    this.onChanged,
    this.errorText,
    this.onFieldSubmitted,
  });

  final String label;
  final TextInputAction textInputAction;
  final bool enabled;
  final bool obscureText;
  final VoidCallback? onToggleVisibility;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return SignUpLineField(
      hintText: label,
      obscureText: obscureText,
      textInputAction: textInputAction,
      enabled: enabled,
      onChanged: onChanged,
      errorText: errorText,
      onFieldSubmitted: onFieldSubmitted,
      suffixIcon: IconButton(
        onPressed: onToggleVisibility,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints.tightFor(width: 24, height: 24),
        icon: Icon(
          obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: const Color(0xFFB5B5B5),
          size: 18,
        ),
      ),
    );
  }
}

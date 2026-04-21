import 'package:flutter/material.dart';

import 'sign_in_line_field.dart';

class SignInPasswordField extends StatelessWidget {
  const SignInPasswordField({
    super.key,
    this.onChanged,
    this.errorText,
    this.enabled = true,
    this.obscureText = true,
    this.onToggleVisibility,
    this.onFieldSubmitted,
  });

  final ValueChanged<String>? onChanged;
  final String? errorText;
  final bool enabled;
  final bool obscureText;
  final VoidCallback? onToggleVisibility;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return SignInLineField(
      label: 'Password',
      obscureText: obscureText,
      textInputAction: TextInputAction.done,
      onChanged: onChanged,
      errorText: errorText,
      enabled: enabled,
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

import 'package:flutter/material.dart';

import 'sign_in_colors.dart';

class SignInLineField extends StatelessWidget {
  const SignInLineField({
    super.key,
    required this.label,
    this.initialValue,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.errorText,
    this.enabled = true,
    this.onFieldSubmitted,
  });

  final String label;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final bool enabled;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 1),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: kSignInMuted,
            fontSize: 10,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w400,
            height: 1,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          initialValue: initialValue,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          onChanged: onChanged,
          enabled: enabled,
          onFieldSubmitted: onFieldSubmitted,
          cursorColor: kSignInOrange,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: kSignInText,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1,
            letterSpacing: 0,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            errorText: errorText,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: kSignInLine, width: 1),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kSignInLine, width: 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kSignInOrange, width: 1.1),
            ),
            suffixIcon: suffixIcon,
            suffixIconConstraints: const BoxConstraints.tightFor(
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'sign_up_colors.dart';

class SignUpLineField extends StatelessWidget {
  const SignUpLineField({
    super.key,
    this.label,
    this.initialValue,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.enabled = true,
    this.errorText,
    this.textCapitalization = TextCapitalization.none,
  }) : assert(
         initialValue == null || controller == null,
         'Cannot provide both initialValue and controller',
       );

  final String? label;
  final String? initialValue;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final bool enabled;
  final String? errorText;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    final TextStyle? labelStyle = Theme.of(context).textTheme.bodySmall
        ?.copyWith(
          color: kSignUpMuted,
          fontSize: 10,
          height: 1,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w400,
        );

    final TextStyle? valueStyle = Theme.of(context).textTheme.bodyMedium
        ?.copyWith(
          color: kSignUpText,
          fontSize: 14,
          height: 1,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null) ...<Widget>[
          Text(label!, style: labelStyle),
          const SizedBox(height: 4),
        ],
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          enabled: enabled,
          textCapitalization: textCapitalization,
          cursorColor: kSignUpOrange,
          style: valueStyle,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            hintText: hintText,
            hintStyle: valueStyle?.copyWith(color: kSignUpMuted),
            errorText: errorText,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: kSignUpLine, width: 1),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kSignUpLine, width: 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kSignUpOrange, width: 1.1),
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

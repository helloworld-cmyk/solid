import 'package:flutter/material.dart';

import 'sign_in_colors.dart';

class SignInRememberRow extends StatelessWidget {
  const SignInRememberRow({
    super.key,
    this.isSelected = true,
    this.onRememberTap,
    this.onForgotPassword,
  });

  final bool isSelected;
  final VoidCallback? onRememberTap;
  final VoidCallback? onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: onRememberTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _RememberCheckBox(isSelected: isSelected),
              const SizedBox(width: 8),
              Text(
                'Remember Me',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: kSignInMuted,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onForgotPassword,
          child: Text(
            'Forgot Password?',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: kSignInOrange,
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
              height: 1,
            ),
          ),
        ),
      ],
    );
  }
}

class _RememberCheckBox extends StatelessWidget {
  const _RememberCheckBox({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13,
      height: 13,
      decoration: BoxDecoration(
        color: isSelected ? kSignInOrange : Colors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: isSelected ? kSignInOrange : const Color(0xFFB7B7B7),
          width: 1,
        ),
      ),
      child: Center(
        child: isSelected
            ? const Icon(Icons.check, size: 9, color: Colors.white)
            : null,
      ),
    );
  }
}

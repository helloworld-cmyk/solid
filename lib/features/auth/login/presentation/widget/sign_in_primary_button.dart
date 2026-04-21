import 'package:flutter/material.dart';

import 'sign_in_colors.dart';

class SignInPrimaryButton extends StatelessWidget {
  const SignInPrimaryButton({
    super.key,
    this.onPressed,
    this.label = 'SIGN IN',
  });

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(18));

    return Material(
      color: kSignInOrange,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius,
        child: SizedBox(
          height: 38,
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
                height: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

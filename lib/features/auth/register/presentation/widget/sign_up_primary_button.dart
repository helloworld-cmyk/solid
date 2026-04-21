import 'package:flutter/material.dart';

import 'sign_up_colors.dart';

class SignUpPrimaryButton extends StatelessWidget {
  const SignUpPrimaryButton({
    super.key,
    this.onPressed,
    this.label = 'SIGN UP',
  });

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(18));

    return Material(
      color: kSignUpOrange,
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
                fontSize: 12.2,
                fontWeight: FontWeight.w500,
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

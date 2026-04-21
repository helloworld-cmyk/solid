import 'package:flutter/material.dart';

import 'sign_in_colors.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key, this.onRegisterTap});

  final VoidCallback? onRegisterTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account? ",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xFF131313),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 0,
              height: 1,
            ),
          ),
          GestureDetector(
            onTap: onRegisterTap,
            child: Text(
              'Register',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: kSignInOrange,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

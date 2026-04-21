import 'package:flutter/material.dart';

class SignInBackButton extends StatelessWidget {
  const SignInBackButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkResponse(
        onTap: onTap,
        radius: 20,
        splashColor: Colors.white24,
        highlightColor: Colors.transparent,
        child: const SizedBox(
          width: 32,
          height: 32,
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SignUpBackButton extends StatelessWidget {
  const SignUpBackButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkResponse(
        onTap: onTap,
        radius: 22,
        highlightColor: Colors.transparent,
        child: const SizedBox(
          width: 18,
          height: 18,
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 18,
            color: Color(0xFF2A2A2A),
          ),
        ),
      ),
    );
  }
}

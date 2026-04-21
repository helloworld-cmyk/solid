import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'sign_up_colors.dart';

class SignUpSocialButton extends StatelessWidget {
  const SignUpSocialButton({
    super.key,
    required this.label,
    required this.leading,
    this.onTap,
  });

  final String label;
  final Widget leading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(18));

    return Material(
      color: Colors.white,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius,
            border: Border.all(color: kSignUpBorder, width: 1),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                leading,
                const SizedBox(width: 10),
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: const Color(0xFF202020),
                    fontSize: 12.2,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpGoogleLogoMark extends StatelessWidget {
  const SignUpGoogleLogoMark({super.key, this.size = 14});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/icon/icongg.svg', width: size, height: size);
  }
}

class SignUpFacebookLogoMark extends StatelessWidget {
  const SignUpFacebookLogoMark({super.key, this.size = 14});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/icon/iconfb.svg', width: size, height: size);
  }
}

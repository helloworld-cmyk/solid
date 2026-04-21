import 'package:flutter/material.dart';

import 'sign_in_back_button.dart';

class SignInHeroBanner extends StatelessWidget {
  const SignInHeroBanner({super.key, this.onBack});

  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(46),
        bottomRight: Radius.circular(46),
      ),
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 375 / 293,
            child: Image.asset(
              'assets/background/loginbg.png',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            left: 18,
            top: MediaQuery.of(context).padding.top + 10,
            child: SignInBackButton(onTap: onBack),
          ),
        ],
      ),
    );
  }
}

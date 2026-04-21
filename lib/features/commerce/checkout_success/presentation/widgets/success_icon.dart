import 'package:flutter/material.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.local_shipping_outlined,
                size: 50,
                color: Color(0xFFFF6A2B),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 0,
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Color(0xFF4CAF50),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Color(0xFFFFFFFF),
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

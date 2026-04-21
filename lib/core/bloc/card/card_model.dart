import 'package:flutter/material.dart';

class PaymentCardModel {
  const PaymentCardModel({
    required this.id,
    required this.cardHolder,
    required this.cardNumber,
    required this.expiryDate,
    required this.gradientColors,
  });

  final String id;
  final String cardHolder;
  final String cardNumber;
  final String expiryDate;
  final List<Color> gradientColors;

  String get lastFourDigits {
    final String digits = cardNumber.replaceAll(RegExp(r'\D'), '');
    if (digits.length <= 4) {
      return digits;
    }
    return digits.substring(digits.length - 4);
  }
}

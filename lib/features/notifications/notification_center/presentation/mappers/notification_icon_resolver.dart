import 'package:flutter/material.dart';

abstract class NotificationIconRule {
  bool supports(String type);

  IconData get icon;
}

class ExactTypeIconRule implements NotificationIconRule {
  const ExactTypeIconRule({required String type, required this.icon})
    : _type = type;

  final String _type;

  @override
  final IconData icon;

  @override
  bool supports(String type) => type == _type;
}

class NotificationIconResolver {
  const NotificationIconResolver({
    required List<NotificationIconRule> rules,
    this.fallback = Icons.notifications_none_outlined,
  }) : _rules = rules;

  factory NotificationIconResolver.standard() {
    return const NotificationIconResolver(
      rules: <NotificationIconRule>[
        ExactTypeIconRule(type: 'order', icon: Icons.shopping_bag_outlined),
        ExactTypeIconRule(
          type: 'shipping',
          icon: Icons.local_shipping_outlined,
        ),
        ExactTypeIconRule(type: 'discount', icon: Icons.percent_outlined),
      ],
    );
  }

  final List<NotificationIconRule> _rules;
  final IconData fallback;

  IconData resolve(String type) {
    for (final NotificationIconRule rule in _rules) {
      if (rule.supports(type)) {
        return rule.icon;
      }
    }

    return fallback;
  }
}

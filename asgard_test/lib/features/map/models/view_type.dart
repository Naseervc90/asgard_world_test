import 'package:flutter/material.dart';

enum ViewType { cycle, shopping, restaurant }

extension ViewTypeExtension on ViewType {
  String get name {
    return toString().split('.').last.capitalize();
  }

  IconData get icon {
    switch (this) {
      case ViewType.cycle:
        return Icons.directions_bike;
      case ViewType.shopping:
        return Icons.shopping_cart;
      case ViewType.restaurant:
        return Icons.restaurant;
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

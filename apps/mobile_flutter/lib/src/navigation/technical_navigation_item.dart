import 'package:flutter/material.dart';

class TechnicalNavigationItem {
  const TechnicalNavigationItem({
    required this.label,
    required this.icon,
    required this.description,
    this.isActive = false,
  });

  final String label;
  final IconData icon;
  final String description;
  final bool isActive;
}

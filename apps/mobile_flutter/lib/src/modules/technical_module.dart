import 'package:flutter/material.dart';

class TechnicalModule {
  const TechnicalModule({
    required this.title,
    required this.description,
    required this.status,
    required this.icon,
  });

  final String title;
  final String description;
  final String status;
  final IconData icon;
}

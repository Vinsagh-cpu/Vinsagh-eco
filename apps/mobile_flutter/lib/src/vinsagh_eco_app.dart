import 'package:flutter/material.dart';

import 'theme/vinsagh_theme.dart';
import 'technical_dashboard_screen.dart';

class VinsaghEcoApp extends StatelessWidget {
  const VinsaghEcoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vinsagh Eco Studios',
      theme: VinsaghTheme.light(),
      home: const TechnicalDashboardScreen(),
    );
  }
}

import 'package:flutter/material.dart';

import 'technical_dashboard_screen.dart';

class VinsaghEcoApp extends StatelessWidget {
  const VinsaghEcoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vinsagh Eco Studios',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF225C4A),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const TechnicalDashboardScreen(),
    );
  }
}

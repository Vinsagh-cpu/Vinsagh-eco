import 'package:flutter/material.dart';

import 'features/home/home_screen.dart';
import 'theme/vinsagh_theme.dart';

class VinsaghEcoApp extends StatelessWidget {
  const VinsaghEcoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vinsagh Eco Studios',
      theme: VinsaghTheme.light(),
      home: const HomeScreen(),
    );
  }
}

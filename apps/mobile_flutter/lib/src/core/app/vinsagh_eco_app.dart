import 'package:flutter/material.dart';

import '../../shared/theme/vinsagh_theme.dart';
import 'lumea_app_entry.dart';

class VinsaghEcoApp extends StatelessWidget {
  const VinsaghEcoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vinsagh Eco Studios',
      theme: VinsaghTheme.light(),
      home: const LumeaAppEntry(),
    );
  }
}

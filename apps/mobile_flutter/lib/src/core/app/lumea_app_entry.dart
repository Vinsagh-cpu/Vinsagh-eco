import 'package:flutter/material.dart';

class LumeaAppEntry extends StatelessWidget {
  const LumeaAppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(child: _BootstrapReadinessView())),
    );
  }
}

class _BootstrapReadinessView extends StatelessWidget {
  const _BootstrapReadinessView();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Lumea bootstrap ready',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Lumea',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 12),
          Text(
            'Bootstrap ready',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

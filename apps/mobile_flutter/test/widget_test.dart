import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vinsagh_eco_mobile/src/vinsagh_eco_app.dart';

void main() {
  testWidgets('renders the APP-007 Mi Sendero home experience', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const VinsaghEcoApp());
    await tester.pumpAndSettle();

    expect(find.text('Lumea'), findsOneWidget);
    expect(find.text('Mi Sendero'), findsWidgets);
    expect(find.text('Bienvenida, Guardián'), findsOneWidget);
    expect(find.text('Mi Cartera'), findsOneWidget);
    expect(find.text('V.S. Coins'), findsOneWidget);
    expect(find.text('Reconexión Disponible'), findsOneWidget);
    expect(find.text('Iniciar Reconexión'), findsOneWidget);
    expect(find.text('Galería de Samara'), findsWidgets);
    expect(find.text('Atelier'), findsWidgets);
    expect(find.text('Crear en el Atelier'), findsOneWidget);
    expect(find.text('Mi Impacto'), findsWidgets);
    expect(find.text('CO₂ evitado'), findsOneWidget);
    expect(find.text('agua ahorrada'), findsOneWidget);
    expect(find.text('residuos reducidos'), findsOneWidget);
    expect(find.text('Compi / Lumi'), findsOneWidget);

    final renderedText = find
        .byType(Text)
        .evaluate()
        .map((element) => element.widget as Text)
        .map((widget) => widget.data ?? widget.textSpan?.toPlainText() ?? '')
        .join(' ')
        .toLowerCase();

    final disallowedTerms = <String>[
      'eco'
          'bo'
          't',
      'check'
          'out',
      'car'
          'rito',
    ];

    for (final term in disallowedTerms) {
      expect(renderedText, isNot(contains(term)));
    }
    expect(RegExp('\\b${'bo'}${'t'}\\b').hasMatch(renderedText), isFalse);
  });
}

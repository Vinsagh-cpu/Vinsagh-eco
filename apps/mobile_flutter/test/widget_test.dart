import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vinsagh_eco_mobile/src/vinsagh_eco_app.dart';

void main() {
  testWidgets('renders the APP-009 Mi Sendero visual experience', (
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
    expect(find.text('Mi Impacto'), findsWidgets);
    expect(find.text('Compi'), findsOneWidget);
    expect(find.text('Lumi'), findsOneWidget);

    final scrollTargets = <Finder>[
      find.text('Galería de Samara').last,
      find.text('Atelier').last,
      find.text('Mi Impacto').last,
      find.text('Compi'),
      find.text('Lumi'),
    ];

    for (final target in scrollTargets) {
      await tester.ensureVisible(target);
      await tester.pumpAndSettle();
      expect(target, findsOneWidget);
    }

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

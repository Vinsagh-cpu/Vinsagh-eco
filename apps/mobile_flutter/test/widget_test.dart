import 'package:flutter_test/flutter_test.dart';

import 'package:vinsagh_eco_mobile/src/vinsagh_eco_app.dart';

void main() {
  testWidgets('renders the APP-004 technical theme layout', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const VinsaghEcoApp());
    await tester.pumpAndSettle();

    expect(find.text('Vinsagh Eco Studios'), findsOneWidget);
    expect(find.textContaining('APP-004'), findsOneWidget);
    expect(find.textContaining('Tema visual'), findsOneWidget);
    expect(find.text('Flutter Web base activo'), findsOneWidget);
    expect(find.text('Sin Firebase'), findsOneWidget);
    expect(find.text('Sin Flame'), findsOneWidget);
    expect(find.text('Sin assets reales'), findsOneWidget);
    expect(find.text('PACKAGE-002'), findsOneWidget);
    expect(find.text('Entorno controlado'), findsOneWidget);
  });
}

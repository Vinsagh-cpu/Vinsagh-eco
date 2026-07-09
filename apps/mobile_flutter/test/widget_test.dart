import 'package:flutter_test/flutter_test.dart';

import 'package:vinsagh_eco_mobile/src/vinsagh_eco_app.dart';

void main() {
  testWidgets('renders the APP-007 vertical 001 placeholder layout', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const VinsaghEcoApp());
    await tester.pumpAndSettle();

    expect(find.text('Vinsagh Eco Studios'), findsOneWidget);
    expect(find.textContaining('APP-007'), findsOneWidget);
    expect(find.textContaining('Vertical 001'), findsWidgets);
    expect(find.textContaining('Primera Travesía'), findsWidgets);
    expect(find.text('Flutter Web base activo'), findsOneWidget);
    expect(find.text('Sin Firebase'), findsOneWidget);
    expect(find.text('Sin Flame'), findsOneWidget);
    expect(find.text('Sin assets reales'), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';

import 'package:vinsagh_eco_mobile/main.dart';

void main() {
  testWidgets('renders the APP-002 technical layout', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const VinsaghEcoApp());
    await tester.pumpAndSettle();

    expect(find.text('Vinsagh Eco Studios'), findsWidgets);
    expect(find.textContaining('APP-002'), findsOneWidget);
    expect(find.text('Flutter Web base activo'), findsWidgets);
    expect(find.text('Sin Firebase'), findsWidgets);
    expect(find.text('Sin Flame'), findsWidgets);
    expect(find.text('Sin assets reales'), findsWidgets);
  });
}

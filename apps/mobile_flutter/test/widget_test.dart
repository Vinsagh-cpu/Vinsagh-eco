import 'package:flutter_test/flutter_test.dart';

import 'package:vinsagh_eco_mobile/src/vinsagh_eco_app.dart';

void main() {
  testWidgets('renders the APP-003 technical widget layout', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const VinsaghEcoApp());
    await tester.pumpAndSettle();

    expect(find.text('Vinsagh Eco Studios'), findsOneWidget);
    expect(find.textContaining('APP-003'), findsOneWidget);
    expect(find.text('Flutter Web base activo'), findsOneWidget);
    expect(find.text('Sin Firebase'), findsOneWidget);
    expect(find.text('Sin Flame'), findsOneWidget);
    expect(find.text('Sin assets reales'), findsOneWidget);
  });
}

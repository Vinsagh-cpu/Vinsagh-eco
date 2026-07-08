import 'package:flutter_test/flutter_test.dart';

import 'package:vinsagh_eco_mobile/main.dart';

void main() {
  testWidgets('renders the controlled technical screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const VinsaghEcoApp());

    expect(find.text('Vinsagh Eco Studios'), findsOneWidget);
    expect(find.textContaining('APP-001'), findsOneWidget);
  });
}

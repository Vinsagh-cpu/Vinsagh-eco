import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/core/app/vinsagh_eco_app.dart';

void main() {
  testWidgets('Lumea bootstrap renders definitive entry point', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const VinsaghEcoApp());

    expect(find.text('Lumea'), findsOneWidget);
    expect(find.text('Bootstrap ready'), findsOneWidget);
  });
}

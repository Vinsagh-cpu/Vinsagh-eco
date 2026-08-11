import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/core/app/lumea_app_entry.dart';

void main() {
  group('InternalLightPreviewAccess', () {
    testWidgets('keeps the internal preview access hidden by default', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: LumeaAppEntry()));

      expect(
        find.byKey(const Key('internalLightPreviewAccessButton')),
        findsNothing,
      );
    });

    testWidgets('opens the light preview harness when explicitly enabled', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LumeaAppEntry(internalPreviewAccessEnabled: true),
        ),
      );

      expect(
        find.byKey(const Key('internalLightPreviewAccessButton')),
        findsOneWidget,
      );

      await tester.tap(
        find.byKey(const Key('internalLightPreviewAccessButton')),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 350));

      expect(find.byKey(const Key('lightPreviewHarness')), findsOneWidget);
      expect(find.byKey(const Key('lightPreviewCanvas')), findsOneWidget);
    });
  });
}

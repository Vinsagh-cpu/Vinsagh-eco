import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/presentation/light/light_preview_harness.dart';

void main() {
  group('LightPreviewHarness', () {
    testWidgets('renders the procedural preview and tuning controls', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: LightPreviewHarness())),
      );

      expect(find.byKey(const Key('lightPreviewHarness')), findsOneWidget);
      expect(find.byKey(const Key('lightPreviewCanvas')), findsOneWidget);
      expect(
        find.byKey(const Key('lightProfilePresetDropdown')),
        findsOneWidget,
      );
      expect(find.byKey(const Key('lightPreviewPhaseSlider')), findsOneWidget);
      expect(
        find.byKey(const Key('lightPreviewIntensitySlider')),
        findsOneWidget,
      );
      expect(find.byKey(const Key('lightPreviewSpreadSlider')), findsOneWidget);
      expect(find.byKey(const Key('lightPreviewSilverSlider')), findsOneWidget);
      expect(
        find.byKey(const Key('lightPreviewParameterReadout')),
        findsOneWidget,
      );
    });

    testWidgets('allows switching between approved light presets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: LightPreviewHarness())),
      );

      expect(
        find.byKey(const Key('activeLightProfile-PRESENCIA')),
        findsOneWidget,
      );

      await tester.tap(find.byKey(const Key('lightProfilePresetDropdown')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('UMBRAL').last);
      await tester.pumpAndSettle();

      expect(
        find.byKey(const Key('activeLightProfile-UMBRAL')),
        findsOneWidget,
      );
    });

    testWidgets('allows local tuning without external assets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: LightPreviewHarness())),
      );

      await tester.drag(
        find.byKey(const Key('lightPreviewIntensitySlider')),
        const Offset(160, 0),
      );
      await tester.drag(
        find.byKey(const Key('lightPreviewSpreadSlider')),
        const Offset(-80, 0),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('lightPreviewCanvas')), findsOneWidget);
      expect(
        find.byKey(const Key('lightPreviewParameterReadout')),
        findsOneWidget,
      );
    });
  });
}

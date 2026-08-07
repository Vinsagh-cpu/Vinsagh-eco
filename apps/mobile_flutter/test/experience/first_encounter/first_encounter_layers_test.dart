import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/presentation/first_encounter_presentation.dart';

void main() {
  group('FirstEncounter layers', () {
    testWidgets('renders reusable scene layers', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: FirstEncounterPresentation(autoplay: false)),
      );

      expect(find.byKey(const Key('firstEncounterLayerStack')), findsOneWidget);
      expect(find.byKey(const Key('backgroundLayer')), findsOneWidget);
      expect(find.byKey(const Key('atmosphereLayer')), findsOneWidget);
      expect(find.byKey(const Key('guardianSilhouetteLayer')), findsOneWidget);
      expect(find.byKey(const Key('eyelidLayer')), findsOneWidget);
      expect(find.byKey(const Key('eyeLayer')), findsOneWidget);
      expect(find.byKey(const Key('focusLayer')), findsOneWidget);
      expect(find.byKey(const Key('lightLayer')), findsOneWidget);
      expect(
        find.byKey(const Key('firstEncounterAccessibilityLayer')),
        findsOneWidget,
      );
    });
  });
}

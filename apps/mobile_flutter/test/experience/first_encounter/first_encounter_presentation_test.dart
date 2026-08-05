import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/application/first_encounter_controller.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/presentation/first_encounter_presentation.dart';

void main() {
  group('FirstEncounterPresentation', () {
    testWidgets('renders the scene without skip before the unlock point', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: FirstEncounterPresentation(autoplay: false)),
      );

      expect(
        find.byKey(const Key('firstEncounterPresentation')),
        findsOneWidget,
      );
      expect(find.byKey(const Key('guardianPresenceCue')), findsOneWidget);
      expect(find.byKey(const Key('firstEncounterSkipButton')), findsNothing);
    });

    testWidgets('shows skip once the controller allows it', (
      WidgetTester tester,
    ) async {
      final FirstEncounterController controller = FirstEncounterController();

      await tester.pumpWidget(
        MaterialApp(
          home: FirstEncounterPresentation(
            controller: controller,
            autoplay: false,
          ),
        ),
      );

      controller.advance(const Duration(seconds: 3));
      await tester.pump();

      expect(find.byKey(const Key('firstEncounterSkipButton')), findsOneWidget);
      expect(find.text('Omitir'), findsOneWidget);

      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  });
}

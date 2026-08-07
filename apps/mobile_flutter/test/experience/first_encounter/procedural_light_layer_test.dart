import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/application/first_encounter_controller.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/presentation/layers/light_layer.dart';

void main() {
  group('LightLayer', () {
    testWidgets('renders procedural light without external assets', (
      WidgetTester tester,
    ) async {
      final FirstEncounterController controller = FirstEncounterController()
        ..advance(const Duration(milliseconds: 5200));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 280,
              height: 220,
              child: LightLayer(state: controller.state),
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('lightLayer')), findsOneWidget);
      expect(find.byKey(const Key('proceduralLight')), findsOneWidget);

      controller.dispose();
    });
  });
}

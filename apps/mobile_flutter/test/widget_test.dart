import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/core/app/vinsagh_eco_app.dart';

void main() {
  testWidgets(
    'Lumea app renders the first encounter presentation entry point',
    (WidgetTester tester) async {
      await tester.pumpWidget(const VinsaghEcoApp());

      expect(
        find.byKey(const Key('firstEncounterPresentation')),
        findsOneWidget,
      );
      expect(find.byKey(const Key('firstEncounterSkipButton')), findsNothing);
    },
  );
}

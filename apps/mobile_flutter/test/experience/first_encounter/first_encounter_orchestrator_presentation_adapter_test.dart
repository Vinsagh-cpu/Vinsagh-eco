import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/core/app/lumea_app_entry.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/presentation/orchestration/first_encounter_orchestrator_presentation_adapter.dart';

void main() {
  group('FirstEncounterOrchestratorPresentationAdapter', () {
    testWidgets('keeps orchestration debug UI hidden by default', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: LumeaAppEntry())),
      );

      expect(
        find.byKey(const Key('firstEncounterOrchestrationDebugPanel')),
        findsNothing,
      );
      expect(
        find.byKey(const Key('guardianRecognitionAcceptedButton')),
        findsNothing,
      );
    });

    testWidgets('exposes orchestration state when debug controls are enabled', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FirstEncounterOrchestratorPresentationAdapter(
              autoplay: false,
              debugControlsEnabled: true,
            ),
          ),
        ),
      );

      expect(
        find.byKey(const Key('firstEncounterOrchestrationDebugPanel')),
        findsOneWidget,
      );
      expect(find.textContaining('SOLANF_PERFORMANCE'), findsOneWidget);
      expect(find.textContaining('PRESENCE'), findsOneWidget);
      expect(find.textContaining('WAITING_FOR_GUARDIAN'), findsOneWidget);
    });

    testWidgets('reaches WAITING_FOR_GUARDIAN without entering bond sequence', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FirstEncounterOrchestratorPresentationAdapter(
              debugControlsEnabled: true,
            ),
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 8400));
      await tester.pump();

      expect(find.textContaining('WAITING_FOR_GUARDIAN'), findsWidgets);
      expect(
        find.byKey(const Key('guardianRecognitionAcceptedButton')),
        findsOneWidget,
      );
      expect(find.textContaining('THRESHOLD_BOND'), findsNothing);
    });

    testWidgets('starts threshold bond after debug recognition action', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FirstEncounterOrchestratorPresentationAdapter(
              debugControlsEnabled: true,
            ),
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 8400));
      await tester.pump();

      await tester.tap(
        find.byKey(const Key('guardianRecognitionAcceptedButton')),
      );
      await tester.pump();

      expect(find.textContaining('THRESHOLD_BOND'), findsOneWidget);
      expect(find.textContaining('CONTACT_PENDING'), findsOneWidget);
    });

    testWidgets('reaches HANDOFF_COMPLETE through the adapter', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FirstEncounterOrchestratorPresentationAdapter(
              debugControlsEnabled: true,
            ),
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 8400));
      await tester.pump();

      await tester.tap(
        find.byKey(const Key('guardianRecognitionAcceptedButton')),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 5200));
      await tester.pump();

      expect(find.textContaining('HANDOFF_COMPLETE'), findsWidgets);
      expect(
        find.byKey(const Key('guardianRecognitionAcceptedButton')),
        findsNothing,
      );
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/application/first_encounter_controller.dart';
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
      expect(
        find.byKey(const Key('firstEncounterVisualPhaseReadout')),
        findsOneWidget,
      );
    });

    testWidgets('does not let the placeholder visual autoplay independently', (
      WidgetTester tester,
    ) async {
      final FirstEncounterController visualController =
          FirstEncounterController();
      addTearDown(visualController.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FirstEncounterOrchestratorPresentationAdapter(
              visualController: visualController,
              autoplay: false,
              debugControlsEnabled: true,
            ),
          ),
        ),
      );

      final initialPhase = visualController.phase;
      final initialProgress = visualController.totalProgress;

      await tester.pump(const Duration(seconds: 10));
      await tester.pump();

      expect(visualController.phase, initialPhase);
      expect(visualController.totalProgress, initialProgress);
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

    testWidgets('pauses placeholder visual at WAITING_FOR_GUARDIAN', (
      WidgetTester tester,
    ) async {
      final FirstEncounterController visualController =
          FirstEncounterController();
      addTearDown(visualController.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FirstEncounterOrchestratorPresentationAdapter(
              visualController: visualController,
              debugControlsEnabled: true,
            ),
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 8400));
      await tester.pump();

      final pausedPhase = visualController.phase;
      final pausedProgress = visualController.totalProgress;

      await tester.pump(const Duration(seconds: 20));
      await tester.pump();

      expect(visualController.phase, pausedPhase);
      expect(visualController.totalProgress, pausedProgress);
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

    testWidgets('resumes placeholder visual after guardian recognition', (
      WidgetTester tester,
    ) async {
      final FirstEncounterController visualController =
          FirstEncounterController();
      addTearDown(visualController.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FirstEncounterOrchestratorPresentationAdapter(
              visualController: visualController,
              debugControlsEnabled: true,
            ),
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 8400));
      await tester.pump();

      final pausedProgress = visualController.totalProgress;

      await tester.tap(
        find.byKey(const Key('guardianRecognitionAcceptedButton')),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 1000));
      await tester.pump();

      expect(visualController.totalProgress, greaterThan(pausedProgress));
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

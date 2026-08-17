import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/orchestration/first_encounter_orchestrator.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/presentation/handoff/first_encounter_presentation_handoff.dart';

void main() {
  group('FirstEncounterPresentationHandoff', () {
    test('remains in progress before HANDOFF_COMPLETE', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      final FirstEncounterPresentationHandoff handoff =
          FirstEncounterPresentationHandoff.fromOrchestrationState(
            orchestrator.state,
          );

      expect(
        handoff.stage,
        FirstEncounterPresentationHandoffStage.firstEncounterInProgress,
      );
      expect(handoff.isIdentityPresentationPending, isFalse);
    });

    test('remains in progress while waiting for Guardian', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));

      final FirstEncounterPresentationHandoff handoff =
          FirstEncounterPresentationHandoff.fromOrchestrationState(
            orchestrator.state,
          );

      expect(
        handoff.stage,
        FirstEncounterPresentationHandoffStage.firstEncounterInProgress,
      );
      expect(handoff.isIdentityPresentationPending, isFalse);
    });

    test('becomes identity presentation pending only at HANDOFF_COMPLETE', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));
      orchestrator.acceptGuardianRecognition();
      orchestrator.advance(const Duration(milliseconds: 5200));

      final FirstEncounterPresentationHandoff handoff =
          FirstEncounterPresentationHandoff.fromOrchestrationState(
            orchestrator.state,
          );

      expect(
        handoff.stage,
        FirstEncounterPresentationHandoffStage.identityPresentationPending,
      );
      expect(handoff.isIdentityPresentationPending, isTrue);
    });

    test('does not auto-present LUMEA identity after handoff', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));
      orchestrator.acceptGuardianRecognition();
      orchestrator.advance(const Duration(milliseconds: 5200));

      final FirstEncounterPresentationHandoff handoff =
          FirstEncounterPresentationHandoff.fromOrchestrationState(
            orchestrator.state,
          );

      expect(handoff.shouldPresentLumeaIdentityAutomatically, isFalse);
      expect(handoff.shouldAnimateIdentityLeafAutomatically, isFalse);
      expect(handoff.shouldRunInheritedGlintAutomatically, isFalse);
      expect(handoff.shouldCompleteCanonicalAByDefault, isFalse);
    });

    test('does not start functional UI or excluded scope automatically', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));
      orchestrator.acceptGuardianRecognition();
      orchestrator.advance(const Duration(milliseconds: 5200));

      final FirstEncounterPresentationHandoff handoff =
          FirstEncounterPresentationHandoff.fromOrchestrationState(
            orchestrator.state,
          );

      expect(handoff.shouldStartFunctionalUiAutomatically, isFalse);
      expect(handoff.shouldStartMenuAutomatically, isFalse);
      expect(handoff.shouldStartTutorialAutomatically, isFalse);
      expect(handoff.includesDc006, isFalse);
      expect(handoff.includesCompi, isFalse);
      expect(handoff.includesLumi, isFalse);
    });
  });
}

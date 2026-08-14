import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/orchestration/first_encounter_orchestration_stage.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/orchestration/first_encounter_orchestrator.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/presentation/visual_state/first_encounter_canonical_visual_state.dart';

void main() {
  group('FirstEncounterCanonicalVisualState', () {
    test('starts as Solanf presence without exposing protected symbols', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      final FirstEncounterCanonicalVisualState visualState =
          FirstEncounterCanonicalVisualState.fromOrchestrationState(
            orchestrator.state,
          );

      expect(
        visualState.moment,
        FirstEncounterCanonicalVisualMoment.solanfPresence,
      );
      expect(
        visualState.orchestrationStage,
        FirstEncounterOrchestrationStage.solanfPerformance,
      );
      expect(
        visualState.footprintPlacement,
        SolanfFootprintPlacement.pawPadsOnly,
      );
      expect(visualState.footprintVisibility, SolanfFootprintVisibility.hidden);
      expect(visualState.aVisualState, CanonicalAVisualState.hidden);
      expect(visualState.exposesRealBiometricData, isFalse);
      expect(visualState.requiresAudio, isFalse);
      expect(visualState.supportsReducedMotionAlternative, isTrue);
      expect(visualState.excludesCompiAndLumi, isTrue);
      expect(visualState.referencesDc006, isFalse);
    });

    test(
      'presents incomplete A only in paw pads while waiting for Guardian',
      () {
        final FirstEncounterOrchestrator orchestrator =
            FirstEncounterOrchestrator();

        orchestrator.advance(const Duration(milliseconds: 8400));

        final FirstEncounterCanonicalVisualState visualState =
            FirstEncounterCanonicalVisualState.fromOrchestrationState(
              orchestrator.state,
            );

        expect(
          visualState.moment,
          FirstEncounterCanonicalVisualMoment.waitingForGuardian,
        );
        expect(
          visualState.orchestrationStage,
          FirstEncounterOrchestrationStage.waitingForGuardian,
        );
        expect(
          visualState.footprintPlacement,
          SolanfFootprintPlacement.pawPadsOnly,
        );
        expect(
          visualState.footprintVisibility,
          SolanfFootprintVisibility.presentedIncomplete,
        );
        expect(visualState.aVisualState, CanonicalAVisualState.incomplete);
        expect(visualState.keepsAIncomplete, isTrue);
        expect(visualState.allowsCompleteA, isFalse);
      },
    );

    test('keeps A incomplete during contact pending', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));
      orchestrator.acceptGuardianRecognition();

      final FirstEncounterCanonicalVisualState visualState =
          FirstEncounterCanonicalVisualState.fromOrchestrationState(
            orchestrator.state,
          );

      expect(
        visualState.moment,
        FirstEncounterCanonicalVisualMoment.contactPending,
      );
      expect(visualState.aVisualState, CanonicalAVisualState.incomplete);
      expect(visualState.keepsAIncomplete, isTrue);
      expect(visualState.allowsCompleteA, isFalse);
    });

    test('keeps A incomplete through bond forming before A_COMPLETION', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));
      orchestrator.acceptGuardianRecognition();
      orchestrator.advance(const Duration(milliseconds: 1200));

      final FirstEncounterCanonicalVisualState visualState =
          FirstEncounterCanonicalVisualState.fromOrchestrationState(
            orchestrator.state,
          );

      expect(
        visualState.moment,
        FirstEncounterCanonicalVisualMoment.bondForming,
      );
      expect(visualState.aVisualState, CanonicalAVisualState.incomplete);
      expect(visualState.keepsAIncomplete, isTrue);
    });

    test('allows the A to complete only at A_COMPLETION', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));
      orchestrator.acceptGuardianRecognition();
      orchestrator.advance(const Duration(milliseconds: 1800));

      final FirstEncounterCanonicalVisualState visualState =
          FirstEncounterCanonicalVisualState.fromOrchestrationState(
            orchestrator.state,
          );

      expect(
        visualState.moment,
        FirstEncounterCanonicalVisualMoment.aCompletion,
      );
      expect(
        visualState.aVisualState,
        CanonicalAVisualState.completingThroughBond,
      );
      expect(visualState.keepsAIncomplete, isFalse);
      expect(visualState.allowsCompleteA, isTrue);
    });

    test('marks footprint awakened in pads after A completion', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));
      orchestrator.acceptGuardianRecognition();
      orchestrator.advance(const Duration(milliseconds: 2200));

      final FirstEncounterCanonicalVisualState visualState =
          FirstEncounterCanonicalVisualState.fromOrchestrationState(
            orchestrator.state,
          );

      expect(
        visualState.moment,
        FirstEncounterCanonicalVisualMoment.footprintAwakened,
      );
      expect(
        visualState.footprintPlacement,
        SolanfFootprintPlacement.pawPadsOnly,
      );
      expect(
        visualState.footprintVisibility,
        SolanfFootprintVisibility.awakenedInPads,
      );
      expect(
        visualState.aVisualState,
        CanonicalAVisualState.completeThroughBond,
      );
    });

    test('maps threshold opening without changing biometric policy', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));
      orchestrator.acceptGuardianRecognition();
      orchestrator.advance(const Duration(milliseconds: 3800));

      final FirstEncounterCanonicalVisualState visualState =
          FirstEncounterCanonicalVisualState.fromOrchestrationState(
            orchestrator.state,
          );

      expect(
        visualState.moment,
        FirstEncounterCanonicalVisualMoment.thresholdOpen,
      );
      expect(
        visualState.guardianRecognitionPolicy,
        GuardianRecognitionVisualPolicy.abstractRecognitionOnly,
      );
      expect(visualState.exposesRealBiometricData, isFalse);
    });

    test('maps handoff complete as terminal visual moment', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));
      orchestrator.acceptGuardianRecognition();
      orchestrator.advance(const Duration(milliseconds: 5200));

      final FirstEncounterCanonicalVisualState visualState =
          FirstEncounterCanonicalVisualState.fromOrchestrationState(
            orchestrator.state,
          );

      expect(
        visualState.moment,
        FirstEncounterCanonicalVisualMoment.handoffComplete,
      );
      expect(
        visualState.orchestrationStage,
        FirstEncounterOrchestrationStage.handoffComplete,
      );
      expect(visualState.allowsCompleteA, isTrue);
    });

    test('keeps footprint exclusively in paw pads across milestones', () {
      final List<Duration> thresholdMilestones = <Duration>[
        Duration.zero,
        const Duration(milliseconds: 400),
        const Duration(milliseconds: 1000),
        const Duration(milliseconds: 1800),
        const Duration(milliseconds: 2200),
        const Duration(milliseconds: 3800),
        const Duration(milliseconds: 5200),
      ];

      for (final Duration thresholdElapsed in thresholdMilestones) {
        final FirstEncounterOrchestrator orchestrator =
            FirstEncounterOrchestrator();

        orchestrator.advance(const Duration(milliseconds: 8400));
        orchestrator.acceptGuardianRecognition();
        orchestrator.advance(thresholdElapsed);

        final FirstEncounterCanonicalVisualState visualState =
            FirstEncounterCanonicalVisualState.fromOrchestrationState(
              orchestrator.state,
            );

        expect(visualState.keepsFootprintInPawPads, isTrue);
      }
    });

    test('does not incorporate DC-006, Compi or Lumi', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));
      orchestrator.acceptGuardianRecognition();
      orchestrator.advance(const Duration(milliseconds: 5200));

      final FirstEncounterCanonicalVisualState visualState =
          FirstEncounterCanonicalVisualState.fromOrchestrationState(
            orchestrator.state,
          );

      expect(visualState.includesCompi, isFalse);
      expect(visualState.includesLumi, isFalse);
      expect(visualState.excludesCompiAndLumi, isTrue);
      expect(visualState.referencesDc006, isFalse);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/orchestration/first_encounter_orchestration_stage.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/orchestration/first_encounter_orchestrator.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/solanf_performance/solanf_performance_phase.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/threshold_bond/threshold_bond_phase.dart';

void main() {
  group('FirstEncounterOrchestrator', () {
    test('starts with Solanf performance active', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      expect(
        orchestrator.state.stage,
        FirstEncounterOrchestrationStage.solanfPerformance,
      );
      expect(
        orchestrator.state.solanfState.phase,
        SolanfPerformancePhase.presence,
      );
      expect(
        orchestrator.state.thresholdBondState.phase,
        ThresholdBondPhase.waitingForGuardian,
      );
    });

    test('moves to WAITING_FOR_GUARDIAN after Solanf performance timing', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));

      expect(
        orchestrator.state.stage,
        FirstEncounterOrchestrationStage.waitingForGuardian,
      );
      expect(
        orchestrator.state.solanfState.phase,
        SolanfPerformancePhase.waitingForGuardian,
      );
      expect(orchestrator.state.isWaitingForGuardian, isTrue);
    });

    test('does not advance into threshold bond without guardian trigger', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));
      orchestrator.advance(const Duration(seconds: 20));

      expect(
        orchestrator.state.stage,
        FirstEncounterOrchestrationStage.waitingForGuardian,
      );
      expect(
        orchestrator.state.thresholdBondState.phase,
        ThresholdBondPhase.waitingForGuardian,
      );
      expect(orchestrator.state.guardianRecognitionAccepted, isFalse);
    });

    test('ignores guardian trigger before Solanf reaches waiting state', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.acceptGuardianRecognition();

      expect(
        orchestrator.state.stage,
        FirstEncounterOrchestrationStage.solanfPerformance,
      );
      expect(orchestrator.state.guardianRecognitionAccepted, isFalse);
    });

    test('starts threshold bond after guardianRecognitionAccepted', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));
      orchestrator.acceptGuardianRecognition();

      expect(
        orchestrator.state.stage,
        FirstEncounterOrchestrationStage.thresholdBond,
      );
      expect(orchestrator.state.guardianRecognitionAccepted, isTrue);
      expect(
        orchestrator.state.thresholdBondState.phase,
        ThresholdBondPhase.contactPending,
      );
    });

    test('reaches HANDOFF_COMPLETE after the threshold bond sequence', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));
      orchestrator.acceptGuardianRecognition();
      orchestrator.advance(const Duration(milliseconds: 5200));

      expect(
        orchestrator.state.stage,
        FirstEncounterOrchestrationStage.handoffComplete,
      );
      expect(orchestrator.state.isTerminal, isTrue);
      expect(
        orchestrator.state.thresholdBondState.phase,
        ThresholdBondPhase.handoffComplete,
      );
    });

    test('does not advance after HANDOFF_COMPLETE', () {
      final FirstEncounterOrchestrator orchestrator =
          FirstEncounterOrchestrator();

      orchestrator.advance(const Duration(milliseconds: 8400));
      orchestrator.acceptGuardianRecognition();
      orchestrator.advance(const Duration(milliseconds: 5200));

      final terminalState = orchestrator.state;

      orchestrator.advance(const Duration(seconds: 30));

      expect(orchestrator.state.stage, terminalState.stage);
      expect(
        orchestrator.state.thresholdBondState.phase,
        terminalState.thresholdBondState.phase,
      );
    });
  });

  group('FirstEncounterOrchestrationStage', () {
    test('exposes canonical orchestration codes', () {
      expect(
        FirstEncounterOrchestrationStage.solanfPerformance.code,
        'SOLANF_PERFORMANCE',
      );
      expect(
        FirstEncounterOrchestrationStage.waitingForGuardian.code,
        'WAITING_FOR_GUARDIAN',
      );
      expect(
        FirstEncounterOrchestrationStage.thresholdBond.code,
        'THRESHOLD_BOND',
      );
      expect(
        FirstEncounterOrchestrationStage.handoffComplete.code,
        'HANDOFF_COMPLETE',
      );
    });
  });
}

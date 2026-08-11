import '../solanf_performance/solanf_performance_state.dart';
import '../solanf_performance/solanf_performance_timeline.dart';
import '../threshold_bond/threshold_bond_controller.dart';
import '../threshold_bond/threshold_bond_phase.dart';
import '../threshold_bond/threshold_bond_state.dart';
import '../threshold_bond/threshold_bond_trigger.dart';
import 'first_encounter_orchestration_stage.dart';
import 'first_encounter_orchestration_state.dart';

class FirstEncounterOrchestrator {
  FirstEncounterOrchestrator({
    SolanfPerformanceTimeline? solanfTimeline,
    ThresholdBondController? thresholdBondController,
  }) : solanfTimeline = solanfTimeline ?? SolanfPerformanceTimeline.official(),
       thresholdBondController =
           thresholdBondController ?? ThresholdBondController();

  final SolanfPerformanceTimeline solanfTimeline;
  final ThresholdBondController thresholdBondController;

  Duration _solanfElapsed = Duration.zero;
  FirstEncounterOrchestrationStage _stage =
      FirstEncounterOrchestrationStage.solanfPerformance;

  FirstEncounterOrchestrationState get state {
    final SolanfPerformanceState solanfState = solanfTimeline.stateAt(
      _solanfElapsed,
    );
    final ThresholdBondState thresholdState = thresholdBondController.state;

    return FirstEncounterOrchestrationState(
      stage: _resolvedStage(
        solanfState: solanfState,
        thresholdBondState: thresholdState,
      ),
      solanfState: solanfState,
      thresholdBondState: thresholdState,
    );
  }

  void advance(Duration delta) {
    if (delta.isNegative || delta == Duration.zero) {
      return;
    }

    if (state.isTerminal) {
      return;
    }

    if (_stage == FirstEncounterOrchestrationStage.solanfPerformance) {
      _solanfElapsed += delta;

      if (solanfTimeline.stateAt(_solanfElapsed).isWaitingForGuardian) {
        _stage = FirstEncounterOrchestrationStage.waitingForGuardian;
      }

      return;
    }

    if (_stage == FirstEncounterOrchestrationStage.waitingForGuardian) {
      return;
    }

    thresholdBondController.advance(delta);

    if (thresholdBondController.state.phase ==
        ThresholdBondPhase.handoffComplete) {
      _stage = FirstEncounterOrchestrationStage.handoffComplete;
    }
  }

  void acceptGuardianRecognition() {
    if (_stage != FirstEncounterOrchestrationStage.waitingForGuardian) {
      return;
    }

    thresholdBondController.applyTrigger(
      ThresholdBondTrigger.guardianRecognitionAccepted,
    );
    _stage = FirstEncounterOrchestrationStage.thresholdBond;
  }

  FirstEncounterOrchestrationStage _resolvedStage({
    required SolanfPerformanceState solanfState,
    required ThresholdBondState thresholdBondState,
  }) {
    if (_stage == FirstEncounterOrchestrationStage.handoffComplete) {
      return FirstEncounterOrchestrationStage.handoffComplete;
    }

    if (_stage == FirstEncounterOrchestrationStage.thresholdBond &&
        thresholdBondState.isTerminal) {
      return FirstEncounterOrchestrationStage.handoffComplete;
    }

    if (_stage == FirstEncounterOrchestrationStage.waitingForGuardian ||
        solanfState.isWaitingForGuardian &&
            _stage == FirstEncounterOrchestrationStage.solanfPerformance) {
      return FirstEncounterOrchestrationStage.waitingForGuardian;
    }

    return _stage;
  }
}

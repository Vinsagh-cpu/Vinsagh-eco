import '../solanf_performance/solanf_performance_state.dart';
import '../threshold_bond/threshold_bond_state.dart';
import 'first_encounter_orchestration_stage.dart';

class FirstEncounterOrchestrationState {
  const FirstEncounterOrchestrationState({
    required this.stage,
    required this.solanfState,
    required this.thresholdBondState,
  });

  final FirstEncounterOrchestrationStage stage;
  final SolanfPerformanceState solanfState;
  final ThresholdBondState thresholdBondState;

  bool get isWaitingForGuardian {
    return stage == FirstEncounterOrchestrationStage.waitingForGuardian;
  }

  bool get isTerminal => stage.isTerminal;

  bool get guardianRecognitionAccepted {
    return stage == FirstEncounterOrchestrationStage.thresholdBond ||
        stage == FirstEncounterOrchestrationStage.handoffComplete;
  }
}

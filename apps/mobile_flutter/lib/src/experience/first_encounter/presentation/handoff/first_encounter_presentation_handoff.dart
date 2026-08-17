import '../../domain/orchestration/first_encounter_orchestration_stage.dart';
import '../../domain/orchestration/first_encounter_orchestration_state.dart';

enum FirstEncounterPresentationHandoffStage {
  firstEncounterInProgress,
  identityPresentationPending,
}

class FirstEncounterPresentationHandoff {
  const FirstEncounterPresentationHandoff({required this.stage});

  factory FirstEncounterPresentationHandoff.fromOrchestrationState(
    FirstEncounterOrchestrationState orchestrationState,
  ) {
    final bool firstEncounterCompleted =
        orchestrationState.stage ==
        FirstEncounterOrchestrationStage.handoffComplete;

    return FirstEncounterPresentationHandoff(
      stage: firstEncounterCompleted
          ? FirstEncounterPresentationHandoffStage.identityPresentationPending
          : FirstEncounterPresentationHandoffStage.firstEncounterInProgress,
    );
  }

  final FirstEncounterPresentationHandoffStage stage;

  bool get isIdentityPresentationPending {
    return stage ==
        FirstEncounterPresentationHandoffStage.identityPresentationPending;
  }

  bool get shouldPresentLumeaIdentityAutomatically => false;

  bool get shouldAnimateIdentityLeafAutomatically => false;

  bool get shouldRunInheritedGlintAutomatically => false;

  bool get shouldStartFunctionalUiAutomatically => false;

  bool get shouldStartMenuAutomatically => false;

  bool get shouldStartTutorialAutomatically => false;

  bool get shouldCompleteCanonicalAByDefault => false;

  bool get includesDc006 => false;

  bool get includesCompi => false;

  bool get includesLumi => false;
}

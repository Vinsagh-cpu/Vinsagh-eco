enum FirstEncounterOrchestrationStage {
  solanfPerformance,
  waitingForGuardian,
  thresholdBond,
  handoffComplete,
}

extension FirstEncounterOrchestrationStageX
    on FirstEncounterOrchestrationStage {
  String get code {
    return switch (this) {
      FirstEncounterOrchestrationStage.solanfPerformance =>
        'SOLANF_PERFORMANCE',
      FirstEncounterOrchestrationStage.waitingForGuardian =>
        'WAITING_FOR_GUARDIAN',
      FirstEncounterOrchestrationStage.thresholdBond => 'THRESHOLD_BOND',
      FirstEncounterOrchestrationStage.handoffComplete => 'HANDOFF_COMPLETE',
    };
  }

  bool get isTerminal {
    return this == FirstEncounterOrchestrationStage.handoffComplete;
  }
}

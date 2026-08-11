enum ThresholdBondPhase {
  waitingForGuardian,
  contactPending,
  recognitionResponse,
  bondForming,
  aCompletion,
  footprintAwakened,
  thresholdResponse,
  thresholdOpen,
  handoffComplete,
}

extension ThresholdBondPhaseX on ThresholdBondPhase {
  String get code {
    return switch (this) {
      ThresholdBondPhase.waitingForGuardian => 'WAITING_FOR_GUARDIAN',
      ThresholdBondPhase.contactPending => 'CONTACT_PENDING',
      ThresholdBondPhase.recognitionResponse => 'RECOGNITION_RESPONSE',
      ThresholdBondPhase.bondForming => 'BOND_FORMING',
      ThresholdBondPhase.aCompletion => 'A_COMPLETION',
      ThresholdBondPhase.footprintAwakened => 'FOOTPRINT_AWAKENED',
      ThresholdBondPhase.thresholdResponse => 'THRESHOLD_RESPONSE',
      ThresholdBondPhase.thresholdOpen => 'THRESHOLD_OPEN',
      ThresholdBondPhase.handoffComplete => 'HANDOFF_COMPLETE',
    };
  }

  bool get isTerminal {
    return this == ThresholdBondPhase.handoffComplete;
  }

  bool get allowsCompleteA {
    return index >= ThresholdBondPhase.aCompletion.index;
  }

  bool get mustKeepAIncomplete {
    return !allowsCompleteA;
  }
}

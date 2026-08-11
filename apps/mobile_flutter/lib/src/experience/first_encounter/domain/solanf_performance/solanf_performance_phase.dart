enum SolanfPerformancePhase {
  presence,
  detection,
  opening,
  focus,
  recognition,
  exhalation,
  approach,
  reverence,
  presentation,
  waitingForGuardian,
}

extension SolanfPerformancePhaseX on SolanfPerformancePhase {
  String get code {
    return switch (this) {
      SolanfPerformancePhase.presence => 'PRESENCE',
      SolanfPerformancePhase.detection => 'DETECTION',
      SolanfPerformancePhase.opening => 'OPENING',
      SolanfPerformancePhase.focus => 'FOCUS',
      SolanfPerformancePhase.recognition => 'RECOGNITION',
      SolanfPerformancePhase.exhalation => 'EXHALATION',
      SolanfPerformancePhase.approach => 'APPROACH',
      SolanfPerformancePhase.reverence => 'REVERENCE',
      SolanfPerformancePhase.presentation => 'PRESENTATION',
      SolanfPerformancePhase.waitingForGuardian => 'WAITING_FOR_GUARDIAN',
    };
  }

  bool get isWaitingForGuardian {
    return this == SolanfPerformancePhase.waitingForGuardian;
  }
}

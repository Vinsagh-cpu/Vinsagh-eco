enum AwakeningStatus {
  dormant,
  firstSignalReceived,
  thresholdCrossed,
  guardianContacted,
  awakened,
}

extension AwakeningStatusX on AwakeningStatus {
  bool get hasStarted => this != AwakeningStatus.dormant;

  bool get hasCrossedThreshold =>
      index >= AwakeningStatus.thresholdCrossed.index;

  bool get hasContactedGuardian =>
      index >= AwakeningStatus.guardianContacted.index;

  bool get isComplete => this == AwakeningStatus.awakened;
}

enum ThresholdBondTrigger { guardianRecognitionAccepted }

extension ThresholdBondTriggerX on ThresholdBondTrigger {
  String get code {
    return switch (this) {
      ThresholdBondTrigger.guardianRecognitionAccepted =>
        'guardianRecognitionAccepted',
    };
  }
}

import 'threshold_bond_phase.dart';

class ThresholdBondStep {
  const ThresholdBondStep({
    required this.phase,
    required this.start,
    this.duration,
  });

  final ThresholdBondPhase phase;
  final Duration start;
  final Duration? duration;

  bool get isIndefinite => duration == null;

  Duration? get end {
    final Duration? stepDuration = duration;

    if (stepDuration == null) {
      return null;
    }

    return start + stepDuration;
  }

  bool contains(Duration elapsed) {
    final Duration normalizedElapsed = elapsed.isNegative
        ? Duration.zero
        : elapsed;

    if (normalizedElapsed < start) {
      return false;
    }

    final Duration? stepEnd = end;

    if (stepEnd == null) {
      return true;
    }

    return normalizedElapsed < stepEnd;
  }
}

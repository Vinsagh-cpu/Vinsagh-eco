import 'threshold_bond_phase.dart';
import 'threshold_bond_state.dart';
import 'threshold_bond_step.dart';

class ThresholdBondTimeline {
  const ThresholdBondTimeline._({
    required this.steps,
    required this.timedDuration,
  });

  factory ThresholdBondTimeline.official() {
    const Duration contactStart = Duration.zero;
    const Duration recognitionStart = Duration(milliseconds: 400);
    const Duration bondStart = Duration(milliseconds: 1000);
    const Duration aCompletionStart = Duration(milliseconds: 1800);
    const Duration footprintStart = Duration(milliseconds: 2200);
    const Duration thresholdResponseStart = Duration(milliseconds: 2600);
    const Duration thresholdOpenStart = Duration(milliseconds: 3800);
    const Duration handoffStart = Duration(milliseconds: 5200);

    return const ThresholdBondTimeline._(
      timedDuration: handoffStart,
      steps: <ThresholdBondStep>[
        ThresholdBondStep(
          phase: ThresholdBondPhase.contactPending,
          start: contactStart,
          duration: Duration(milliseconds: 400),
        ),
        ThresholdBondStep(
          phase: ThresholdBondPhase.recognitionResponse,
          start: recognitionStart,
          duration: Duration(milliseconds: 600),
        ),
        ThresholdBondStep(
          phase: ThresholdBondPhase.bondForming,
          start: bondStart,
          duration: Duration(milliseconds: 800),
        ),
        ThresholdBondStep(
          phase: ThresholdBondPhase.aCompletion,
          start: aCompletionStart,
          duration: Duration(milliseconds: 400),
        ),
        ThresholdBondStep(
          phase: ThresholdBondPhase.footprintAwakened,
          start: footprintStart,
          duration: Duration(milliseconds: 400),
        ),
        ThresholdBondStep(
          phase: ThresholdBondPhase.thresholdResponse,
          start: thresholdResponseStart,
          duration: Duration(milliseconds: 1200),
        ),
        ThresholdBondStep(
          phase: ThresholdBondPhase.thresholdOpen,
          start: thresholdOpenStart,
          duration: Duration(milliseconds: 1400),
        ),
        ThresholdBondStep(
          phase: ThresholdBondPhase.handoffComplete,
          start: handoffStart,
        ),
      ],
    );
  }

  final List<ThresholdBondStep> steps;
  final Duration timedDuration;

  ThresholdBondStep stepFor(ThresholdBondPhase phase) {
    return steps.firstWhere((ThresholdBondStep step) {
      return step.phase == phase;
    });
  }

  ThresholdBondState stateAt(Duration elapsedAfterRecognitionAccepted) {
    final Duration normalizedElapsed =
        elapsedAfterRecognitionAccepted.isNegative
        ? Duration.zero
        : elapsedAfterRecognitionAccepted;

    final ThresholdBondStep activeStep = steps.firstWhere((
      ThresholdBondStep step,
    ) {
      return step.contains(normalizedElapsed);
    }, orElse: () => steps.last);

    return ThresholdBondState(
      phase: activeStep.phase,
      elapsed: normalizedElapsed,
      phaseProgress: _phaseProgress(activeStep, normalizedElapsed),
      totalProgress: _totalProgress(normalizedElapsed),
    );
  }

  double _phaseProgress(ThresholdBondStep step, Duration elapsed) {
    final Duration? duration = step.duration;

    if (duration == null) {
      return 1;
    }

    if (duration.inMicroseconds <= 0) {
      return 1;
    }

    final int elapsedInsideStep = (elapsed - step.start).inMicroseconds;

    return (elapsedInsideStep / duration.inMicroseconds).clamp(0, 1).toDouble();
  }

  double _totalProgress(Duration elapsed) {
    if (timedDuration.inMicroseconds <= 0) {
      return 1;
    }

    return (elapsed.inMicroseconds / timedDuration.inMicroseconds)
        .clamp(0, 1)
        .toDouble();
  }
}

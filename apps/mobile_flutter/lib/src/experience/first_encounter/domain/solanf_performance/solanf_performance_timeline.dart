import 'solanf_performance_phase.dart';
import 'solanf_performance_state.dart';
import 'solanf_performance_step.dart';

class SolanfPerformanceTimeline {
  const SolanfPerformanceTimeline._({
    required this.steps,
    required this.timedDuration,
  });

  factory SolanfPerformanceTimeline.official() {
    const Duration presenceStart = Duration.zero;
    const Duration detectionStart = Duration(milliseconds: 1200);
    const Duration openingStart = Duration(milliseconds: 1800);
    const Duration focusStart = Duration(milliseconds: 3000);
    const Duration recognitionStart = Duration(milliseconds: 3400);
    const Duration exhalationStart = Duration(milliseconds: 4200);
    const Duration approachStart = Duration(milliseconds: 4800);
    const Duration reverenceStart = Duration(milliseconds: 6200);
    const Duration presentationStart = Duration(milliseconds: 7400);
    const Duration waitingStart = Duration(milliseconds: 8400);

    return const SolanfPerformanceTimeline._(
      timedDuration: waitingStart,
      steps: <SolanfPerformanceStep>[
        SolanfPerformanceStep(
          phase: SolanfPerformancePhase.presence,
          start: presenceStart,
          duration: Duration(milliseconds: 1200),
        ),
        SolanfPerformanceStep(
          phase: SolanfPerformancePhase.detection,
          start: detectionStart,
          duration: Duration(milliseconds: 600),
        ),
        SolanfPerformanceStep(
          phase: SolanfPerformancePhase.opening,
          start: openingStart,
          duration: Duration(milliseconds: 1200),
        ),
        SolanfPerformanceStep(
          phase: SolanfPerformancePhase.focus,
          start: focusStart,
          duration: Duration(milliseconds: 400),
        ),
        SolanfPerformanceStep(
          phase: SolanfPerformancePhase.recognition,
          start: recognitionStart,
          duration: Duration(milliseconds: 800),
        ),
        SolanfPerformanceStep(
          phase: SolanfPerformancePhase.exhalation,
          start: exhalationStart,
          duration: Duration(milliseconds: 600),
        ),
        SolanfPerformanceStep(
          phase: SolanfPerformancePhase.approach,
          start: approachStart,
          duration: Duration(milliseconds: 1400),
        ),
        SolanfPerformanceStep(
          phase: SolanfPerformancePhase.reverence,
          start: reverenceStart,
          duration: Duration(milliseconds: 1200),
        ),
        SolanfPerformanceStep(
          phase: SolanfPerformancePhase.presentation,
          start: presentationStart,
          duration: Duration(milliseconds: 1000),
        ),
        SolanfPerformanceStep(
          phase: SolanfPerformancePhase.waitingForGuardian,
          start: waitingStart,
        ),
      ],
    );
  }

  final List<SolanfPerformanceStep> steps;
  final Duration timedDuration;

  SolanfPerformanceStep stepFor(SolanfPerformancePhase phase) {
    return steps.firstWhere((SolanfPerformanceStep step) {
      return step.phase == phase;
    });
  }

  SolanfPerformanceState stateAt(Duration elapsed) {
    final Duration normalizedElapsed = elapsed.isNegative
        ? Duration.zero
        : elapsed;

    final SolanfPerformanceStep activeStep = steps.firstWhere((
      SolanfPerformanceStep step,
    ) {
      return step.contains(normalizedElapsed);
    }, orElse: () => steps.last);

    return SolanfPerformanceState(
      phase: activeStep.phase,
      elapsed: normalizedElapsed,
      phaseProgress: _phaseProgress(activeStep, normalizedElapsed),
      totalProgress: _totalProgress(normalizedElapsed),
    );
  }

  double _phaseProgress(SolanfPerformanceStep step, Duration elapsed) {
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

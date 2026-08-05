import 'first_encounter_phase.dart';
import 'first_encounter_step.dart';

class FirstEncounterTimeline {
  const FirstEncounterTimeline({
    required this.steps,
    this.skipUnlockAt = const Duration(seconds: 3),
  });

  factory FirstEncounterTimeline.official() {
    return const FirstEncounterTimeline(
      steps: <FirstEncounterStep>[
        FirstEncounterStep(
          phase: FirstEncounterPhase.darkness,
          duration: Duration(milliseconds: 800),
        ),
        FirstEncounterStep(
          phase: FirstEncounterPhase.eyelidsClosed,
          duration: Duration(milliseconds: 700),
        ),
        FirstEncounterStep(
          phase: FirstEncounterPhase.earsReact,
          duration: Duration(milliseconds: 600),
        ),
        FirstEncounterStep(
          phase: FirstEncounterPhase.firstBlink,
          duration: Duration(milliseconds: 600),
        ),
        FirstEncounterStep(
          phase: FirstEncounterPhase.openingEyes,
          duration: Duration(milliseconds: 1100),
        ),
        FirstEncounterStep(
          phase: FirstEncounterPhase.huntingFocus,
          duration: Duration(milliseconds: 550),
        ),
        FirstEncounterStep(
          phase: FirstEncounterPhase.recognition,
          duration: Duration(milliseconds: 750),
        ),
        FirstEncounterStep(
          phase: FirstEncounterPhase.pupilLeafFormation,
          duration: Duration(milliseconds: 1100),
        ),
        FirstEncounterStep(
          phase: FirstEncounterPhase.irisLightBreath,
          duration: Duration(milliseconds: 800),
        ),
        FirstEncounterStep(
          phase: FirstEncounterPhase.silverGlint,
          duration: Duration(milliseconds: 300),
        ),
        FirstEncounterStep(
          phase: FirstEncounterPhase.lumeaInFocus,
          duration: Duration(milliseconds: 1400),
        ),
        FirstEncounterStep(
          phase: FirstEncounterPhase.invitation,
          duration: Duration(milliseconds: 1300),
        ),
      ],
    );
  }

  final List<FirstEncounterStep> steps;
  final Duration skipUnlockAt;

  Duration get totalDuration {
    return steps.fold<Duration>(
      Duration.zero,
      (Duration total, FirstEncounterStep step) => total + step.duration,
    );
  }

  Duration clampElapsed(Duration elapsed) {
    if (elapsed.isNegative) {
      return Duration.zero;
    }

    if (elapsed.compareTo(totalDuration) > 0) {
      return totalDuration;
    }

    return elapsed;
  }

  FirstEncounterPhase phaseAt(Duration elapsed) {
    final Duration normalized = clampElapsed(elapsed);

    if (normalized.compareTo(totalDuration) >= 0) {
      return FirstEncounterPhase.completed;
    }

    Duration cursor = Duration.zero;

    for (final FirstEncounterStep step in steps) {
      final Duration end = cursor + step.duration;

      if (normalized.compareTo(end) < 0) {
        return step.phase;
      }

      cursor = end;
    }

    return FirstEncounterPhase.completed;
  }

  Duration phaseStart(FirstEncounterPhase phase) {
    if (phase == FirstEncounterPhase.completed) {
      return totalDuration;
    }

    Duration cursor = Duration.zero;

    for (final FirstEncounterStep step in steps) {
      if (step.phase == phase) {
        return cursor;
      }

      cursor += step.duration;
    }

    throw ArgumentError.value(phase, 'phase', 'Phase is not in this timeline.');
  }

  Duration phaseDuration(FirstEncounterPhase phase) {
    if (phase == FirstEncounterPhase.completed) {
      return Duration.zero;
    }

    for (final FirstEncounterStep step in steps) {
      if (step.phase == phase) {
        return step.duration;
      }
    }

    throw ArgumentError.value(phase, 'phase', 'Phase is not in this timeline.');
  }

  double phaseProgressAt(Duration elapsed) {
    final Duration normalized = clampElapsed(elapsed);
    final FirstEncounterPhase phase = phaseAt(normalized);

    if (phase == FirstEncounterPhase.completed) {
      return 1;
    }

    final Duration start = phaseStart(phase);
    final Duration duration = phaseDuration(phase);

    final double progress =
        (normalized - start).inMicroseconds / duration.inMicroseconds;

    return progress.clamp(0, 1).toDouble();
  }

  double totalProgressAt(Duration elapsed) {
    final Duration normalized = clampElapsed(elapsed);

    return (normalized.inMicroseconds / totalDuration.inMicroseconds)
        .clamp(0, 1)
        .toDouble();
  }

  List<FirstEncounterPhase> phasesEnteredBetween({
    required Duration previous,
    required Duration next,
  }) {
    final Duration from = clampElapsed(previous);
    final Duration to = clampElapsed(next);

    if (to.compareTo(from) <= 0) {
      return const <FirstEncounterPhase>[];
    }

    final List<FirstEncounterPhase> result = <FirstEncounterPhase>[];
    Duration cursor = Duration.zero;

    for (final FirstEncounterStep step in steps) {
      if (cursor.compareTo(from) > 0 && cursor.compareTo(to) <= 0) {
        result.add(step.phase);
      }

      cursor += step.duration;
    }

    if (from.compareTo(totalDuration) < 0 && to.compareTo(totalDuration) >= 0) {
      result.add(FirstEncounterPhase.completed);
    }

    return result;
  }
}

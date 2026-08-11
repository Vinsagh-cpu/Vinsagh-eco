import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/solanf_performance/solanf_performance_phase.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/solanf_performance/solanf_performance_timeline.dart';

void main() {
  group('SolanfPerformanceTimeline', () {
    test('uses the approved ANIM-001 timing contract', () {
      final SolanfPerformanceTimeline timeline =
          SolanfPerformanceTimeline.official();

      expect(timeline.timedDuration, const Duration(milliseconds: 8400));
      expect(timeline.steps, hasLength(10));

      expect(
        timeline.stepFor(SolanfPerformancePhase.presence).start,
        Duration.zero,
      );
      expect(
        timeline.stepFor(SolanfPerformancePhase.detection).start,
        const Duration(milliseconds: 1200),
      );
      expect(
        timeline.stepFor(SolanfPerformancePhase.opening).start,
        const Duration(milliseconds: 1800),
      );
      expect(
        timeline.stepFor(SolanfPerformancePhase.focus).start,
        const Duration(milliseconds: 3000),
      );
      expect(
        timeline.stepFor(SolanfPerformancePhase.recognition).start,
        const Duration(milliseconds: 3400),
      );
      expect(
        timeline.stepFor(SolanfPerformancePhase.exhalation).start,
        const Duration(milliseconds: 4200),
      );
      expect(
        timeline.stepFor(SolanfPerformancePhase.approach).start,
        const Duration(milliseconds: 4800),
      );
      expect(
        timeline.stepFor(SolanfPerformancePhase.reverence).start,
        const Duration(milliseconds: 6200),
      );
      expect(
        timeline.stepFor(SolanfPerformancePhase.presentation).start,
        const Duration(milliseconds: 7400),
      );
      expect(
        timeline.stepFor(SolanfPerformancePhase.waitingForGuardian).start,
        const Duration(milliseconds: 8400),
      );
    });

    test('maps elapsed time to Solanf performance phases', () {
      final SolanfPerformanceTimeline timeline =
          SolanfPerformanceTimeline.official();

      expect(
        timeline.stateAt(Duration.zero).phase,
        SolanfPerformancePhase.presence,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 1200)).phase,
        SolanfPerformancePhase.detection,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 1800)).phase,
        SolanfPerformancePhase.opening,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 3000)).phase,
        SolanfPerformancePhase.focus,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 3400)).phase,
        SolanfPerformancePhase.recognition,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 4200)).phase,
        SolanfPerformancePhase.exhalation,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 4800)).phase,
        SolanfPerformancePhase.approach,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 6200)).phase,
        SolanfPerformancePhase.reverence,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 7400)).phase,
        SolanfPerformancePhase.presentation,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 8400)).phase,
        SolanfPerformancePhase.waitingForGuardian,
      );
    });

    test('does not continue by timer after WAITING_FOR_GUARDIAN', () {
      final SolanfPerformanceTimeline timeline =
          SolanfPerformanceTimeline.official();

      final waitingState = timeline.stateAt(const Duration(milliseconds: 8400));
      final laterState = timeline.stateAt(const Duration(seconds: 30));

      expect(waitingState.phase, SolanfPerformancePhase.waitingForGuardian);
      expect(laterState.phase, SolanfPerformancePhase.waitingForGuardian);
      expect(laterState.isWaitingForGuardian, isTrue);
      expect(laterState.totalProgress, 1);
      expect(laterState.phaseProgress, 1);
    });

    test('keeps all progress values bounded', () {
      final SolanfPerformanceTimeline timeline =
          SolanfPerformanceTimeline.official();

      for (final Duration elapsed in <Duration>[
        const Duration(milliseconds: -250),
        Duration.zero,
        const Duration(milliseconds: 600),
        const Duration(milliseconds: 2500),
        const Duration(milliseconds: 5000),
        const Duration(milliseconds: 8300),
        const Duration(milliseconds: 8400),
        const Duration(seconds: 60),
      ]) {
        final state = timeline.stateAt(elapsed);

        expect(state.phaseProgress, inInclusiveRange(0, 1));
        expect(state.totalProgress, inInclusiveRange(0, 1));
      }
    });
  });

  group('SolanfPerformancePhase', () {
    test('exposes the canonical WAITING_FOR_GUARDIAN code', () {
      expect(
        SolanfPerformancePhase.waitingForGuardian.code,
        'WAITING_FOR_GUARDIAN',
      );
      expect(
        SolanfPerformancePhase.waitingForGuardian.isWaitingForGuardian,
        isTrue,
      );
    });
  });
}

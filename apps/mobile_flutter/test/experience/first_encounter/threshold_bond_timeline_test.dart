import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/threshold_bond/threshold_bond_controller.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/threshold_bond/threshold_bond_phase.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/threshold_bond/threshold_bond_timeline.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/threshold_bond/threshold_bond_trigger.dart';

void main() {
  group('ThresholdBondTimeline', () {
    test('uses the approved FX-002 v1.1 timing contract', () {
      final ThresholdBondTimeline timeline = ThresholdBondTimeline.official();

      expect(timeline.timedDuration, const Duration(milliseconds: 5200));
      expect(timeline.steps, hasLength(8));

      expect(
        timeline.stepFor(ThresholdBondPhase.contactPending).start,
        Duration.zero,
      );
      expect(
        timeline.stepFor(ThresholdBondPhase.recognitionResponse).start,
        const Duration(milliseconds: 400),
      );
      expect(
        timeline.stepFor(ThresholdBondPhase.bondForming).start,
        const Duration(milliseconds: 1000),
      );
      expect(
        timeline.stepFor(ThresholdBondPhase.aCompletion).start,
        const Duration(milliseconds: 1800),
      );
      expect(
        timeline.stepFor(ThresholdBondPhase.footprintAwakened).start,
        const Duration(milliseconds: 2200),
      );
      expect(
        timeline.stepFor(ThresholdBondPhase.thresholdResponse).start,
        const Duration(milliseconds: 2600),
      );
      expect(
        timeline.stepFor(ThresholdBondPhase.thresholdOpen).start,
        const Duration(milliseconds: 3800),
      );
      expect(
        timeline.stepFor(ThresholdBondPhase.handoffComplete).start,
        const Duration(milliseconds: 5200),
      );
    });

    test('maps elapsed time to the threshold bond phases', () {
      final ThresholdBondTimeline timeline = ThresholdBondTimeline.official();

      expect(
        timeline.stateAt(Duration.zero).phase,
        ThresholdBondPhase.contactPending,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 400)).phase,
        ThresholdBondPhase.recognitionResponse,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 1000)).phase,
        ThresholdBondPhase.bondForming,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 1800)).phase,
        ThresholdBondPhase.aCompletion,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 2200)).phase,
        ThresholdBondPhase.footprintAwakened,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 2600)).phase,
        ThresholdBondPhase.thresholdResponse,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 3800)).phase,
        ThresholdBondPhase.thresholdOpen,
      );
      expect(
        timeline.stateAt(const Duration(milliseconds: 5200)).phase,
        ThresholdBondPhase.handoffComplete,
      );
    });

    test('allows the complete A only from A_COMPLETION onward', () {
      final ThresholdBondTimeline timeline = ThresholdBondTimeline.official();

      for (final Duration elapsed in <Duration>[
        Duration.zero,
        const Duration(milliseconds: 399),
        const Duration(milliseconds: 999),
        const Duration(milliseconds: 1799),
      ]) {
        final state = timeline.stateAt(elapsed);

        expect(state.mustKeepAIncomplete, isTrue);
        expect(state.allowsCompleteA, isFalse);
      }

      for (final Duration elapsed in <Duration>[
        const Duration(milliseconds: 1800),
        const Duration(milliseconds: 2200),
        const Duration(milliseconds: 2600),
        const Duration(milliseconds: 3800),
        const Duration(milliseconds: 5200),
      ]) {
        final state = timeline.stateAt(elapsed);

        expect(state.allowsCompleteA, isTrue);
        expect(state.mustKeepAIncomplete, isFalse);
      }
    });

    test('never exposes real biometric data in any phase', () {
      final ThresholdBondTimeline timeline = ThresholdBondTimeline.official();

      for (final Duration elapsed in <Duration>[
        Duration.zero,
        const Duration(milliseconds: 400),
        const Duration(milliseconds: 1000),
        const Duration(milliseconds: 1800),
        const Duration(milliseconds: 2200),
        const Duration(milliseconds: 2600),
        const Duration(milliseconds: 3800),
        const Duration(milliseconds: 5200),
      ]) {
        expect(timeline.stateAt(elapsed).exposesRealBiometricData, isFalse);
      }
    });

    test('keeps progress values bounded', () {
      final ThresholdBondTimeline timeline = ThresholdBondTimeline.official();

      for (final Duration elapsed in <Duration>[
        const Duration(milliseconds: -250),
        Duration.zero,
        const Duration(milliseconds: 250),
        const Duration(milliseconds: 1200),
        const Duration(milliseconds: 2600),
        const Duration(milliseconds: 4200),
        const Duration(milliseconds: 5200),
        const Duration(seconds: 20),
      ]) {
        final state = timeline.stateAt(elapsed);

        expect(state.phaseProgress, inInclusiveRange(0, 1));
        expect(state.totalProgress, inInclusiveRange(0, 1));
      }
    });
  });

  group('ThresholdBondController', () {
    test(
      'stays in WAITING_FOR_GUARDIAN until the abstract trigger arrives',
      () {
        final ThresholdBondController controller = ThresholdBondController();

        controller.advance(const Duration(seconds: 20));

        expect(controller.state.phase, ThresholdBondPhase.waitingForGuardian);
        expect(controller.guardianRecognitionAccepted, isFalse);
        expect(controller.state.mustKeepAIncomplete, isTrue);
      },
    );

    test('starts the bond sequence after guardianRecognitionAccepted', () {
      final ThresholdBondController controller = ThresholdBondController();

      controller.applyTrigger(ThresholdBondTrigger.guardianRecognitionAccepted);

      expect(controller.guardianRecognitionAccepted, isTrue);
      expect(controller.state.phase, ThresholdBondPhase.contactPending);

      controller.advance(const Duration(milliseconds: 1800));

      expect(controller.state.phase, ThresholdBondPhase.aCompletion);
      expect(controller.state.allowsCompleteA, isTrue);
    });

    test('reaches HANDOFF_COMPLETE and does not advance past it', () {
      final ThresholdBondController controller = ThresholdBondController()
        ..acceptGuardianRecognition();

      controller.advance(const Duration(milliseconds: 5200));

      final terminalState = controller.state;

      controller.advance(const Duration(seconds: 10));

      expect(terminalState.phase, ThresholdBondPhase.handoffComplete);
      expect(controller.state.phase, ThresholdBondPhase.handoffComplete);
      expect(controller.state.totalProgress, 1);
      expect(controller.state.phaseProgress, 1);
    });
  });

  group('ThresholdBondTrigger', () {
    test('exposes the canonical abstract trigger code', () {
      expect(
        ThresholdBondTrigger.guardianRecognitionAccepted.code,
        'guardianRecognitionAccepted',
      );
    });
  });
}

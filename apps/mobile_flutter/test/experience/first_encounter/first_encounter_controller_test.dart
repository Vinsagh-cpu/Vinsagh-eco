import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/application/first_encounter_controller.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/first_encounter_event.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/first_encounter_phase.dart';

void main() {
  group('FirstEncounterController', () {
    test('starts in darkness with no skip on first playback', () {
      final FirstEncounterController controller = FirstEncounterController();

      expect(controller.phase, FirstEncounterPhase.darkness);
      expect(controller.totalProgress, 0);
      expect(controller.canSkip, isFalse);

      controller.dispose();
    });

    test('unlocks skip after three seconds on first playback', () {
      final FirstEncounterController controller = FirstEncounterController();

      controller.advance(const Duration(milliseconds: 2999));
      expect(controller.canSkip, isFalse);

      controller.advance(const Duration(milliseconds: 1));
      expect(controller.canSkip, isTrue);

      controller.dispose();
    });

    test('allows skip from start on replay', () {
      final FirstEncounterController controller = FirstEncounterController(
        isReplay: true,
      );

      expect(controller.canSkip, isTrue);
      expect(controller.skip(), isTrue);
      expect(controller.phase, FirstEncounterPhase.completed);

      controller.dispose();
    });

    test('records events when phases are crossed', () {
      final FirstEncounterController controller = FirstEncounterController();

      controller.advance(const Duration(milliseconds: 850));

      expect(controller.phase, FirstEncounterPhase.eyelidsClosed);
      expect(
        controller.emittedEvents,
        contains(FirstEncounterEvent.eyelidsClosedStarted),
      );

      controller.dispose();
    });

    test('skip is blocked before unlock on first playback', () {
      final FirstEncounterController controller = FirstEncounterController();

      controller.advance(const Duration(seconds: 2));

      expect(controller.skip(), isFalse);
      expect(controller.phase, isNot(FirstEncounterPhase.completed));

      controller.dispose();
    });

    test('complete moves directly to completed', () {
      final FirstEncounterController controller = FirstEncounterController();

      controller.complete();

      expect(controller.phase, FirstEncounterPhase.completed);
      expect(
        controller.emittedEvents,
        contains(FirstEncounterEvent.transitionFinished),
      );

      controller.dispose();
    });
  });
}

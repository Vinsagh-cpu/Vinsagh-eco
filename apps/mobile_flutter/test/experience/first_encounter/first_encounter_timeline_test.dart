import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/first_encounter_phase.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/domain/first_encounter_timeline.dart';

void main() {
  group('FirstEncounterTimeline', () {
    test('matches the approved ten second sequence', () {
      final FirstEncounterTimeline timeline = FirstEncounterTimeline.official();

      expect(timeline.totalDuration, const Duration(seconds: 10));
      expect(timeline.phaseAt(Duration.zero), FirstEncounterPhase.darkness);
      expect(
        timeline.phaseAt(const Duration(milliseconds: 800)),
        FirstEncounterPhase.eyelidsClosed,
      );
      expect(
        timeline.phaseAt(const Duration(milliseconds: 1500)),
        FirstEncounterPhase.earsReact,
      );
      expect(
        timeline.phaseAt(const Duration(milliseconds: 3800)),
        FirstEncounterPhase.huntingFocus,
      );
      expect(
        timeline.phaseAt(const Duration(milliseconds: 5100)),
        FirstEncounterPhase.pupilLeafFormation,
      );
      expect(
        timeline.phaseAt(const Duration(seconds: 10)),
        FirstEncounterPhase.completed,
      );
    });

    test('normalizes phase and total progress', () {
      final FirstEncounterTimeline timeline = FirstEncounterTimeline.official();

      expect(
        timeline.phaseProgressAt(const Duration(milliseconds: 400)),
        closeTo(0.5, 0.001),
      );
      expect(
        timeline.totalProgressAt(const Duration(seconds: 5)),
        closeTo(0.5, 0.001),
      );
      expect(timeline.totalProgressAt(const Duration(seconds: 11)), 1);
    });

    test('reports all phases crossed by a large advance', () {
      final FirstEncounterTimeline timeline = FirstEncounterTimeline.official();

      final List<FirstEncounterPhase> phases = timeline.phasesEnteredBetween(
        previous: Duration.zero,
        next: const Duration(milliseconds: 2100),
      );

      expect(phases, <FirstEncounterPhase>[
        FirstEncounterPhase.eyelidsClosed,
        FirstEncounterPhase.earsReact,
        FirstEncounterPhase.firstBlink,
      ]);
    });
  });
}

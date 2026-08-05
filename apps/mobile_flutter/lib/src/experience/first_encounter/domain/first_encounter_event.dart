import 'first_encounter_phase.dart';

enum FirstEncounterEvent {
  darknessStarted,
  eyelidsClosedStarted,
  earsReacted,
  firstBlinkStarted,
  openingEyesStarted,
  huntingFocusStarted,
  recognitionStarted,
  pupilLeafFormationStarted,
  irisLightBreathStarted,
  silverGlintAppeared,
  lumeaInFocusStarted,
  invitationStarted,
  transitionFinished,
}

extension FirstEncounterEventForPhase on FirstEncounterPhase {
  FirstEncounterEvent get event {
    return switch (this) {
      FirstEncounterPhase.darkness => FirstEncounterEvent.darknessStarted,
      FirstEncounterPhase.eyelidsClosed =>
        FirstEncounterEvent.eyelidsClosedStarted,
      FirstEncounterPhase.earsReact => FirstEncounterEvent.earsReacted,
      FirstEncounterPhase.firstBlink => FirstEncounterEvent.firstBlinkStarted,
      FirstEncounterPhase.openingEyes => FirstEncounterEvent.openingEyesStarted,
      FirstEncounterPhase.huntingFocus =>
        FirstEncounterEvent.huntingFocusStarted,
      FirstEncounterPhase.recognition => FirstEncounterEvent.recognitionStarted,
      FirstEncounterPhase.pupilLeafFormation =>
        FirstEncounterEvent.pupilLeafFormationStarted,
      FirstEncounterPhase.irisLightBreath =>
        FirstEncounterEvent.irisLightBreathStarted,
      FirstEncounterPhase.silverGlint =>
        FirstEncounterEvent.silverGlintAppeared,
      FirstEncounterPhase.lumeaInFocus =>
        FirstEncounterEvent.lumeaInFocusStarted,
      FirstEncounterPhase.invitation => FirstEncounterEvent.invitationStarted,
      FirstEncounterPhase.completed => FirstEncounterEvent.transitionFinished,
    };
  }
}

enum FirstEncounterPhase {
  darkness,
  eyelidsClosed,
  earsReact,
  firstBlink,
  openingEyes,
  huntingFocus,
  recognition,
  pupilLeafFormation,
  irisLightBreath,
  silverGlint,
  lumeaInFocus,
  invitation,
  completed,
}

extension FirstEncounterPhaseX on FirstEncounterPhase {
  bool get isTerminal => this == FirstEncounterPhase.completed;
}

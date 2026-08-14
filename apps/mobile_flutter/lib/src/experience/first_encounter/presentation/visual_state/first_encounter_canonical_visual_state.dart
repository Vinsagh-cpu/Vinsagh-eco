import '../../domain/orchestration/first_encounter_orchestration_stage.dart';
import '../../domain/orchestration/first_encounter_orchestration_state.dart';
import '../../domain/solanf_performance/solanf_performance_phase.dart';
import '../../domain/threshold_bond/threshold_bond_phase.dart';

enum FirstEncounterCanonicalVisualMoment {
  solanfPresence,
  solanfDetection,
  solanfOpening,
  solanfFocus,
  solanfRecognition,
  solanfExhalation,
  solanfApproach,
  solanfReverence,
  footprintPresentation,
  waitingForGuardian,
  contactPending,
  recognitionResponse,
  bondForming,
  aCompletion,
  footprintAwakened,
  thresholdResponse,
  thresholdOpen,
  handoffComplete,
}

enum SolanfFootprintPlacement { pawPadsOnly }

enum SolanfFootprintVisibility {
  hidden,
  hintedInPads,
  presentedIncomplete,
  awakenedInPads,
}

enum CanonicalAVisualState {
  hidden,
  incomplete,
  completingThroughBond,
  completeThroughBond,
}

enum GuardianRecognitionVisualPolicy { abstractRecognitionOnly }

class FirstEncounterCanonicalVisualState {
  const FirstEncounterCanonicalVisualState({
    required this.moment,
    required this.orchestrationStage,
    required this.footprintPlacement,
    required this.footprintVisibility,
    required this.aVisualState,
    required this.guardianRecognitionPolicy,
    required this.requiresAudio,
    required this.supportsReducedMotionAlternative,
    required this.includesCompi,
    required this.includesLumi,
    required this.referencesDc006,
  });

  factory FirstEncounterCanonicalVisualState.fromOrchestrationState(
    FirstEncounterOrchestrationState orchestrationState,
  ) {
    return switch (orchestrationState.stage) {
      FirstEncounterOrchestrationStage.solanfPerformance =>
        _fromSolanfPerformance(orchestrationState),
      FirstEncounterOrchestrationStage.waitingForGuardian =>
        _fromSolanfPerformance(orchestrationState),
      FirstEncounterOrchestrationStage.thresholdBond => _fromThresholdBond(
        orchestrationState,
      ),
      FirstEncounterOrchestrationStage.handoffComplete => _fromThresholdBond(
        orchestrationState,
      ),
    };
  }

  final FirstEncounterCanonicalVisualMoment moment;
  final FirstEncounterOrchestrationStage orchestrationStage;
  final SolanfFootprintPlacement footprintPlacement;
  final SolanfFootprintVisibility footprintVisibility;
  final CanonicalAVisualState aVisualState;
  final GuardianRecognitionVisualPolicy guardianRecognitionPolicy;
  final bool requiresAudio;
  final bool supportsReducedMotionAlternative;
  final bool includesCompi;
  final bool includesLumi;
  final bool referencesDc006;

  bool get exposesRealBiometricData => false;

  bool get keepsFootprintInPawPads {
    return footprintPlacement == SolanfFootprintPlacement.pawPadsOnly;
  }

  bool get keepsAIncomplete {
    return aVisualState == CanonicalAVisualState.hidden ||
        aVisualState == CanonicalAVisualState.incomplete;
  }

  bool get allowsCompleteA {
    return aVisualState == CanonicalAVisualState.completingThroughBond ||
        aVisualState == CanonicalAVisualState.completeThroughBond;
  }

  bool get excludesCompiAndLumi => !includesCompi && !includesLumi;

  static FirstEncounterCanonicalVisualState _fromSolanfPerformance(
    FirstEncounterOrchestrationState orchestrationState,
  ) {
    final SolanfPerformancePhase phase = orchestrationState.solanfState.phase;

    return FirstEncounterCanonicalVisualState(
      moment: _momentForSolanfPhase(phase),
      orchestrationStage: orchestrationState.stage,
      footprintPlacement: SolanfFootprintPlacement.pawPadsOnly,
      footprintVisibility: _footprintVisibilityForSolanfPhase(phase),
      aVisualState: _aStateForSolanfPhase(phase),
      guardianRecognitionPolicy:
          GuardianRecognitionVisualPolicy.abstractRecognitionOnly,
      requiresAudio: false,
      supportsReducedMotionAlternative: true,
      includesCompi: false,
      includesLumi: false,
      referencesDc006: false,
    );
  }

  static FirstEncounterCanonicalVisualState _fromThresholdBond(
    FirstEncounterOrchestrationState orchestrationState,
  ) {
    final ThresholdBondPhase phase =
        orchestrationState.thresholdBondState.phase;

    return FirstEncounterCanonicalVisualState(
      moment: _momentForThresholdBondPhase(phase),
      orchestrationStage: orchestrationState.stage,
      footprintPlacement: SolanfFootprintPlacement.pawPadsOnly,
      footprintVisibility: _footprintVisibilityForThresholdBondPhase(phase),
      aVisualState: _aStateForThresholdBondPhase(phase),
      guardianRecognitionPolicy:
          GuardianRecognitionVisualPolicy.abstractRecognitionOnly,
      requiresAudio: false,
      supportsReducedMotionAlternative: true,
      includesCompi: false,
      includesLumi: false,
      referencesDc006: false,
    );
  }

  static FirstEncounterCanonicalVisualMoment _momentForSolanfPhase(
    SolanfPerformancePhase phase,
  ) {
    return switch (phase) {
      SolanfPerformancePhase.presence =>
        FirstEncounterCanonicalVisualMoment.solanfPresence,
      SolanfPerformancePhase.detection =>
        FirstEncounterCanonicalVisualMoment.solanfDetection,
      SolanfPerformancePhase.opening =>
        FirstEncounterCanonicalVisualMoment.solanfOpening,
      SolanfPerformancePhase.focus =>
        FirstEncounterCanonicalVisualMoment.solanfFocus,
      SolanfPerformancePhase.recognition =>
        FirstEncounterCanonicalVisualMoment.solanfRecognition,
      SolanfPerformancePhase.exhalation =>
        FirstEncounterCanonicalVisualMoment.solanfExhalation,
      SolanfPerformancePhase.approach =>
        FirstEncounterCanonicalVisualMoment.solanfApproach,
      SolanfPerformancePhase.reverence =>
        FirstEncounterCanonicalVisualMoment.solanfReverence,
      SolanfPerformancePhase.presentation =>
        FirstEncounterCanonicalVisualMoment.footprintPresentation,
      SolanfPerformancePhase.waitingForGuardian =>
        FirstEncounterCanonicalVisualMoment.waitingForGuardian,
    };
  }

  static FirstEncounterCanonicalVisualMoment _momentForThresholdBondPhase(
    ThresholdBondPhase phase,
  ) {
    return switch (phase) {
      ThresholdBondPhase.waitingForGuardian =>
        FirstEncounterCanonicalVisualMoment.waitingForGuardian,
      ThresholdBondPhase.contactPending =>
        FirstEncounterCanonicalVisualMoment.contactPending,
      ThresholdBondPhase.recognitionResponse =>
        FirstEncounterCanonicalVisualMoment.recognitionResponse,
      ThresholdBondPhase.bondForming =>
        FirstEncounterCanonicalVisualMoment.bondForming,
      ThresholdBondPhase.aCompletion =>
        FirstEncounterCanonicalVisualMoment.aCompletion,
      ThresholdBondPhase.footprintAwakened =>
        FirstEncounterCanonicalVisualMoment.footprintAwakened,
      ThresholdBondPhase.thresholdResponse =>
        FirstEncounterCanonicalVisualMoment.thresholdResponse,
      ThresholdBondPhase.thresholdOpen =>
        FirstEncounterCanonicalVisualMoment.thresholdOpen,
      ThresholdBondPhase.handoffComplete =>
        FirstEncounterCanonicalVisualMoment.handoffComplete,
    };
  }

  static SolanfFootprintVisibility _footprintVisibilityForSolanfPhase(
    SolanfPerformancePhase phase,
  ) {
    return switch (phase) {
      SolanfPerformancePhase.presence ||
      SolanfPerformancePhase.detection ||
      SolanfPerformancePhase.opening ||
      SolanfPerformancePhase.focus ||
      SolanfPerformancePhase.recognition ||
      SolanfPerformancePhase.exhalation => SolanfFootprintVisibility.hidden,
      SolanfPerformancePhase.approach || SolanfPerformancePhase.reverence =>
        SolanfFootprintVisibility.hintedInPads,
      SolanfPerformancePhase.presentation ||
      SolanfPerformancePhase.waitingForGuardian =>
        SolanfFootprintVisibility.presentedIncomplete,
    };
  }

  static SolanfFootprintVisibility _footprintVisibilityForThresholdBondPhase(
    ThresholdBondPhase phase,
  ) {
    return switch (phase) {
      ThresholdBondPhase.waitingForGuardian ||
      ThresholdBondPhase.contactPending ||
      ThresholdBondPhase.recognitionResponse ||
      ThresholdBondPhase.bondForming ||
      ThresholdBondPhase.aCompletion =>
        SolanfFootprintVisibility.presentedIncomplete,
      ThresholdBondPhase.footprintAwakened ||
      ThresholdBondPhase.thresholdResponse ||
      ThresholdBondPhase.thresholdOpen ||
      ThresholdBondPhase.handoffComplete =>
        SolanfFootprintVisibility.awakenedInPads,
    };
  }

  static CanonicalAVisualState _aStateForSolanfPhase(
    SolanfPerformancePhase phase,
  ) {
    return switch (phase) {
      SolanfPerformancePhase.presence ||
      SolanfPerformancePhase.detection ||
      SolanfPerformancePhase.opening ||
      SolanfPerformancePhase.focus ||
      SolanfPerformancePhase.recognition ||
      SolanfPerformancePhase.exhalation ||
      SolanfPerformancePhase.approach ||
      SolanfPerformancePhase.reverence => CanonicalAVisualState.hidden,
      SolanfPerformancePhase.presentation ||
      SolanfPerformancePhase.waitingForGuardian =>
        CanonicalAVisualState.incomplete,
    };
  }

  static CanonicalAVisualState _aStateForThresholdBondPhase(
    ThresholdBondPhase phase,
  ) {
    if (phase.index < ThresholdBondPhase.aCompletion.index) {
      return CanonicalAVisualState.incomplete;
    }

    if (phase == ThresholdBondPhase.aCompletion) {
      return CanonicalAVisualState.completingThroughBond;
    }

    return CanonicalAVisualState.completeThroughBond;
  }
}

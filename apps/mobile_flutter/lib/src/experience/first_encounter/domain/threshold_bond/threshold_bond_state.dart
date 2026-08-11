import 'threshold_bond_phase.dart';

class ThresholdBondState {
  const ThresholdBondState({
    required this.phase,
    required this.elapsed,
    required this.phaseProgress,
    required this.totalProgress,
  });

  factory ThresholdBondState.waitingForGuardian() {
    return const ThresholdBondState(
      phase: ThresholdBondPhase.waitingForGuardian,
      elapsed: Duration.zero,
      phaseProgress: 1,
      totalProgress: 0,
    );
  }

  final ThresholdBondPhase phase;
  final Duration elapsed;
  final double phaseProgress;
  final double totalProgress;

  bool get isTerminal => phase.isTerminal;

  bool get allowsCompleteA => phase.allowsCompleteA;

  bool get mustKeepAIncomplete => phase.mustKeepAIncomplete;

  bool get exposesRealBiometricData => false;
}

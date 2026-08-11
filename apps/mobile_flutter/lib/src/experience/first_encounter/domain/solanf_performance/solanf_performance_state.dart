import 'solanf_performance_phase.dart';

class SolanfPerformanceState {
  const SolanfPerformanceState({
    required this.phase,
    required this.elapsed,
    required this.phaseProgress,
    required this.totalProgress,
  });

  final SolanfPerformancePhase phase;
  final Duration elapsed;
  final double phaseProgress;
  final double totalProgress;

  bool get isWaitingForGuardian => phase.isWaitingForGuardian;
}

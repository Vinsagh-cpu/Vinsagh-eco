import 'threshold_bond_state.dart';
import 'threshold_bond_timeline.dart';
import 'threshold_bond_trigger.dart';

class ThresholdBondController {
  ThresholdBondController({ThresholdBondTimeline? timeline})
    : timeline = timeline ?? ThresholdBondTimeline.official();

  final ThresholdBondTimeline timeline;

  Duration _elapsedAfterRecognitionAccepted = Duration.zero;
  bool _guardianRecognitionAccepted = false;

  bool get guardianRecognitionAccepted => _guardianRecognitionAccepted;

  ThresholdBondState get state {
    if (!_guardianRecognitionAccepted) {
      return ThresholdBondState.waitingForGuardian();
    }

    return timeline.stateAt(_elapsedAfterRecognitionAccepted);
  }

  void applyTrigger(ThresholdBondTrigger trigger) {
    return switch (trigger) {
      ThresholdBondTrigger.guardianRecognitionAccepted =>
        acceptGuardianRecognition(),
    };
  }

  void acceptGuardianRecognition() {
    if (_guardianRecognitionAccepted) {
      return;
    }

    _guardianRecognitionAccepted = true;
    _elapsedAfterRecognitionAccepted = Duration.zero;
  }

  void advance(Duration delta) {
    if (!_guardianRecognitionAccepted) {
      return;
    }

    if (delta.isNegative || delta == Duration.zero) {
      return;
    }

    if (state.isTerminal) {
      return;
    }

    _elapsedAfterRecognitionAccepted += delta;
  }
}

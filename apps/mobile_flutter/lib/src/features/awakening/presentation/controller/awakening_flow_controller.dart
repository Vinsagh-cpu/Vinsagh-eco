import 'package:flutter/foundation.dart';

import 'awakening_stage.dart';

class AwakeningFlowController extends ChangeNotifier {
  AwakeningFlowController({bool reduceMotion = false}) {
    _reduceMotion = reduceMotion;
  }

  AwakeningStage _stage = AwakeningStage.initialDarkness;
  bool _reduceMotion = false;

  AwakeningStage get stage => _stage;

  bool get reduceMotion => _reduceMotion;

  Set<AwakeningStage> get validNextStages => Set<AwakeningStage>.unmodifiable(
    _validTransitions[_stage] ?? const <AwakeningStage>{},
  );

  bool canTransitionTo(AwakeningStage nextStage) {
    return _validTransitions[_stage]?.contains(nextStage) ?? false;
  }

  bool transitionTo(AwakeningStage nextStage) {
    if (!canTransitionTo(nextStage)) {
      return false;
    }

    _stage = nextStage;
    notifyListeners();
    return true;
  }

  bool advance() {
    final nextStage = _defaultNextStages[_stage];
    if (nextStage == null) {
      return false;
    }

    return transitionTo(nextStage);
  }

  bool requestAuthorization() {
    return transitionTo(AwakeningStage.authorizationRequested);
  }

  bool markAuthorizationAuthorized() {
    return transitionTo(AwakeningStage.authorizationAuthorized);
  }

  bool markAuthorizationCancelled() {
    return transitionTo(AwakeningStage.authorizationCancelled);
  }

  bool markAuthorizationUnavailable() {
    return transitionTo(AwakeningStage.authorizationUnavailable);
  }

  bool markAuthorizationRecoverableError() {
    return transitionTo(AwakeningStage.authorizationRecoverableError);
  }

  void setReduceMotion(bool value) {
    if (_reduceMotion == value) {
      return;
    }

    _reduceMotion = value;
    notifyListeners();
  }

  void reset() {
    if (_stage == AwakeningStage.initialDarkness) {
      return;
    }

    _stage = AwakeningStage.initialDarkness;
    notifyListeners();
  }

  static const Map<AwakeningStage, Set<AwakeningStage>> _validTransitions = {
    AwakeningStage.initialDarkness: {AwakeningStage.footprintVisible},
    AwakeningStage.footprintVisible: {AwakeningStage.invitationVisible},
    AwakeningStage.invitationVisible: {
      AwakeningStage.authorizationRequested,
      AwakeningStage.accessibleAlternative,
    },
    AwakeningStage.authorizationRequested: {
      AwakeningStage.authorizationAuthorized,
      AwakeningStage.authorizationCancelled,
      AwakeningStage.authorizationUnavailable,
      AwakeningStage.authorizationRecoverableError,
    },
    AwakeningStage.authorizationAuthorized: {
      AwakeningStage.awakeningInProgress,
    },
    AwakeningStage.authorizationCancelled: {
      AwakeningStage.invitationVisible,
      AwakeningStage.accessibleAlternative,
    },
    AwakeningStage.authorizationUnavailable: {
      AwakeningStage.accessibleAlternative,
      AwakeningStage.invitationVisible,
    },
    AwakeningStage.authorizationRecoverableError: {
      AwakeningStage.invitationVisible,
      AwakeningStage.accessibleAlternative,
    },
    AwakeningStage.accessibleAlternative: {
      AwakeningStage.awakeningInProgress,
      AwakeningStage.invitationVisible,
    },
    AwakeningStage.awakeningInProgress: {AwakeningStage.compiArrival},
    AwakeningStage.compiArrival: {AwakeningStage.firstBondInProgress},
    AwakeningStage.firstBondInProgress: {AwakeningStage.initialAffinity},
    AwakeningStage.initialAffinity: {AwakeningStage.firstBondCompleted},
    AwakeningStage.firstBondCompleted: {AwakeningStage.portalPending},
    AwakeningStage.portalPending: {AwakeningStage.completed},
    AwakeningStage.completed: <AwakeningStage>{},
  };

  static const Map<AwakeningStage, AwakeningStage> _defaultNextStages = {
    AwakeningStage.initialDarkness: AwakeningStage.footprintVisible,
    AwakeningStage.footprintVisible: AwakeningStage.invitationVisible,
    AwakeningStage.invitationVisible: AwakeningStage.authorizationRequested,
    AwakeningStage.authorizationRequested:
        AwakeningStage.authorizationAuthorized,
    AwakeningStage.authorizationAuthorized: AwakeningStage.awakeningInProgress,
    AwakeningStage.authorizationCancelled: AwakeningStage.invitationVisible,
    AwakeningStage.authorizationUnavailable:
        AwakeningStage.accessibleAlternative,
    AwakeningStage.authorizationRecoverableError:
        AwakeningStage.invitationVisible,
    AwakeningStage.accessibleAlternative: AwakeningStage.awakeningInProgress,
    AwakeningStage.awakeningInProgress: AwakeningStage.compiArrival,
    AwakeningStage.compiArrival: AwakeningStage.firstBondInProgress,
    AwakeningStage.firstBondInProgress: AwakeningStage.initialAffinity,
    AwakeningStage.initialAffinity: AwakeningStage.firstBondCompleted,
    AwakeningStage.firstBondCompleted: AwakeningStage.portalPending,
    AwakeningStage.portalPending: AwakeningStage.completed,
  };
}

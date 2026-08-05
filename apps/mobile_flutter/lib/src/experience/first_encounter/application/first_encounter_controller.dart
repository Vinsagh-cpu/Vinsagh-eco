import 'dart:async';

import '../domain/first_encounter_event.dart';
import '../domain/first_encounter_phase.dart';
import '../domain/first_encounter_timeline.dart';

class FirstEncounterState {
  const FirstEncounterState({
    required this.phase,
    required this.phaseProgress,
    required this.totalProgress,
    required this.canSkip,
  });

  final FirstEncounterPhase phase;
  final double phaseProgress;
  final double totalProgress;
  final bool canSkip;
}

class FirstEncounterController {
  FirstEncounterController({
    FirstEncounterTimeline? timeline,
    this.isReplay = false,
  }) : timeline = timeline ?? FirstEncounterTimeline.official();

  final FirstEncounterTimeline timeline;
  final bool isReplay;

  final StreamController<FirstEncounterState> _stateController =
      StreamController<FirstEncounterState>.broadcast(sync: true);
  final StreamController<FirstEncounterEvent> _eventController =
      StreamController<FirstEncounterEvent>.broadcast(sync: true);

  final List<FirstEncounterEvent> _emittedEvents = <FirstEncounterEvent>[];

  Duration _elapsed = Duration.zero;
  bool _isDisposed = false;

  Stream<FirstEncounterState> get states => _stateController.stream;

  Stream<FirstEncounterEvent> get events => _eventController.stream;

  List<FirstEncounterEvent> get emittedEvents =>
      List<FirstEncounterEvent>.unmodifiable(_emittedEvents);

  Duration get elapsed => _elapsed;

  FirstEncounterPhase get phase => timeline.phaseAt(_elapsed);

  double get phaseProgress => timeline.phaseProgressAt(_elapsed);

  double get totalProgress => timeline.totalProgressAt(_elapsed);

  bool get canSkip {
    return isReplay ||
        phase == FirstEncounterPhase.completed ||
        _elapsed.compareTo(timeline.skipUnlockAt) >= 0;
  }

  FirstEncounterState get state {
    return FirstEncounterState(
      phase: phase,
      phaseProgress: phaseProgress,
      totalProgress: totalProgress,
      canSkip: canSkip,
    );
  }

  void advance(Duration delta) {
    if (delta.isNegative) {
      throw ArgumentError.value(delta, 'delta', 'Delta cannot be negative.');
    }

    if (_isDisposed || phase == FirstEncounterPhase.completed) {
      return;
    }

    final Duration previous = _elapsed;
    _elapsed = timeline.clampElapsed(_elapsed + delta);

    _emitEnteredPhaseEvents(previous: previous, next: _elapsed);
    _stateController.add(state);
  }

  bool skip() {
    if (_isDisposed || !canSkip) {
      return false;
    }

    if (phase == FirstEncounterPhase.completed) {
      return true;
    }

    final Duration previous = _elapsed;
    _elapsed = timeline.totalDuration;

    _emitEnteredPhaseEvents(previous: previous, next: _elapsed);
    _stateController.add(state);

    return true;
  }

  void complete() {
    if (_isDisposed || phase == FirstEncounterPhase.completed) {
      return;
    }

    final Duration previous = _elapsed;
    _elapsed = timeline.totalDuration;

    _emitEnteredPhaseEvents(previous: previous, next: _elapsed);
    _stateController.add(state);
  }

  void dispose() {
    if (_isDisposed) {
      return;
    }

    _isDisposed = true;
    _stateController.close();
    _eventController.close();
  }

  void _emitEnteredPhaseEvents({
    required Duration previous,
    required Duration next,
  }) {
    final List<FirstEncounterPhase> phases = timeline.phasesEnteredBetween(
      previous: previous,
      next: next,
    );

    for (final FirstEncounterPhase phase in phases) {
      final FirstEncounterEvent event = phase.event;
      _emittedEvents.add(event);
      _eventController.add(event);
    }
  }
}

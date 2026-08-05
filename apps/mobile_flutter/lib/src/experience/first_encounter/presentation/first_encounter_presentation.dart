import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../application/first_encounter_controller.dart';
import '../domain/first_encounter_phase.dart';

class FirstEncounterPresentation extends StatefulWidget {
  const FirstEncounterPresentation({
    super.key,
    this.controller,
    this.autoplay = true,
  });

  final FirstEncounterController? controller;
  final bool autoplay;

  @override
  State<FirstEncounterPresentation> createState() =>
      _FirstEncounterPresentationState();
}

class _FirstEncounterPresentationState extends State<FirstEncounterPresentation>
    with SingleTickerProviderStateMixin {
  late final bool _ownsController;
  late final FirstEncounterController _controller;
  late FirstEncounterState _state;

  StreamSubscription<FirstEncounterState>? _stateSubscription;
  Ticker? _ticker;
  Duration _lastTickElapsed = Duration.zero;

  @override
  void initState() {
    super.initState();

    _ownsController = widget.controller == null;
    _controller = widget.controller ?? FirstEncounterController();
    _state = _controller.state;

    _stateSubscription = _controller.states.listen((FirstEncounterState state) {
      if (!mounted) {
        return;
      }

      setState(() {
        _state = state;
      });
    });

    if (widget.autoplay) {
      _ticker = createTicker(_handleTick)..start();
    }
  }

  void _handleTick(Duration elapsed) {
    if (_state.phase.isTerminal) {
      _ticker?.stop();
      return;
    }

    final Duration delta = elapsed - _lastTickElapsed;
    _lastTickElapsed = elapsed;

    if (delta > Duration.zero) {
      _controller.advance(delta);
    }
  }

  @override
  void dispose() {
    _ticker?.dispose();
    _stateSubscription?.cancel();

    if (_ownsController) {
      _controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Semantics(
        label: 'Primer Encuentro de Lumea',
        child: SafeArea(
          child: Stack(
            key: const Key('firstEncounterPresentation'),
            children: <Widget>[
              Positioned.fill(child: _SceneBase(phase: _state.phase)),
              Positioned.fill(child: _EncounterLayerComposition(state: _state)),
              if (_state.canSkip && !_state.phase.isTerminal)
                Positioned(
                  top: 16,
                  right: 16,
                  child: TextButton(
                    key: const Key('firstEncounterSkipButton'),
                    onPressed: _controller.skip,
                    child: const Text('Omitir'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SceneBase extends StatelessWidget {
  const _SceneBase({required this.phase});

  final FirstEncounterPhase phase;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: _radiusForPhase(phase),
          colors: _colorsForPhase(phase),
        ),
      ),
    );
  }

  double _radiusForPhase(FirstEncounterPhase phase) {
    return switch (phase) {
      FirstEncounterPhase.darkness => 0.45,
      FirstEncounterPhase.eyelidsClosed => 0.48,
      FirstEncounterPhase.earsReact => 0.5,
      FirstEncounterPhase.firstBlink => 0.52,
      FirstEncounterPhase.openingEyes => 0.58,
      FirstEncounterPhase.huntingFocus => 0.62,
      FirstEncounterPhase.recognition => 0.68,
      FirstEncounterPhase.pupilLeafFormation => 0.72,
      FirstEncounterPhase.irisLightBreath => 0.78,
      FirstEncounterPhase.silverGlint => 0.82,
      FirstEncounterPhase.lumeaInFocus => 0.9,
      FirstEncounterPhase.invitation => 1,
      FirstEncounterPhase.completed => 1,
    };
  }

  List<Color> _colorsForPhase(FirstEncounterPhase phase) {
    return switch (phase) {
      FirstEncounterPhase.darkness => const <Color>[
        Color(0xFF050403),
        Color(0xFF000000),
      ],
      FirstEncounterPhase.eyelidsClosed ||
      FirstEncounterPhase.earsReact ||
      FirstEncounterPhase.firstBlink => const <Color>[
        Color(0xFF110E0A),
        Color(0xFF020201),
      ],
      FirstEncounterPhase.openingEyes || FirstEncounterPhase.huntingFocus =>
        const <Color>[Color(0xFF2B2110), Color(0xFF050403)],
      FirstEncounterPhase.recognition ||
      FirstEncounterPhase.pupilLeafFormation => const <Color>[
        Color(0xFF4B3916),
        Color(0xFF0A0805),
      ],
      FirstEncounterPhase.irisLightBreath || FirstEncounterPhase.silverGlint =>
        const <Color>[Color(0xFF7A5B21), Color(0xFF111827)],
      FirstEncounterPhase.lumeaInFocus ||
      FirstEncounterPhase.invitation ||
      FirstEncounterPhase.completed => const <Color>[
        Color(0xFF9B7A2A),
        Color(0xFF10291F),
      ],
    };
  }
}

class _EncounterLayerComposition extends StatelessWidget {
  const _EncounterLayerComposition({required this.state});

  final FirstEncounterState state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        height: 220,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _GuardianPresenceCue(phase: state.phase),
            _EyeThresholdCue(state: state),
            _LightBreathCue(state: state),
          ],
        ),
      ),
    );
  }
}

class _GuardianPresenceCue extends StatelessWidget {
  const _GuardianPresenceCue({required this.phase});

  final FirstEncounterPhase phase;

  @override
  Widget build(BuildContext context) {
    final double opacity = switch (phase) {
      FirstEncounterPhase.darkness => 0,
      FirstEncounterPhase.eyelidsClosed => 0.16,
      FirstEncounterPhase.earsReact => 0.22,
      FirstEncounterPhase.firstBlink => 0.28,
      FirstEncounterPhase.openingEyes => 0.34,
      FirstEncounterPhase.huntingFocus => 0.4,
      FirstEncounterPhase.recognition => 0.46,
      FirstEncounterPhase.pupilLeafFormation => 0.52,
      FirstEncounterPhase.irisLightBreath => 0.58,
      FirstEncounterPhase.silverGlint => 0.64,
      FirstEncounterPhase.lumeaInFocus => 0.5,
      FirstEncounterPhase.invitation => 0.44,
      FirstEncounterPhase.completed => 0,
    };

    return Opacity(
      opacity: opacity,
      child: Container(
        key: const Key('guardianPresenceCue'),
        width: 250,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(96),
          border: Border.all(color: const Color(0xFFBCA05A), width: 1.2),
        ),
      ),
    );
  }
}

class _EyeThresholdCue extends StatelessWidget {
  const _EyeThresholdCue({required this.state});

  final FirstEncounterState state;

  @override
  Widget build(BuildContext context) {
    final bool isVisible =
        state.phase.index >= FirstEncounterPhase.eyelidsClosed.index &&
        !state.phase.isTerminal;

    final double opening = switch (state.phase) {
      FirstEncounterPhase.darkness => 0,
      FirstEncounterPhase.eyelidsClosed => 0.04,
      FirstEncounterPhase.earsReact => 0.06,
      FirstEncounterPhase.firstBlink => 0.12,
      FirstEncounterPhase.openingEyes => 0.36,
      FirstEncounterPhase.huntingFocus => 0.28,
      FirstEncounterPhase.recognition => 0.42,
      FirstEncounterPhase.pupilLeafFormation => 0.5,
      FirstEncounterPhase.irisLightBreath => 0.58,
      FirstEncounterPhase.silverGlint => 0.64,
      FirstEncounterPhase.lumeaInFocus => 0.7,
      FirstEncounterPhase.invitation => 0.48,
      FirstEncounterPhase.completed => 0,
    };

    return Opacity(
      opacity: isVisible ? 1 : 0,
      child: Container(
        key: const Key('eyeThresholdCue'),
        width: 176,
        height: 28 + (opening * 56),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1208),
          borderRadius: BorderRadius.circular(120),
          border: Border.all(color: const Color(0xFFE0C36A), width: 1.4),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xFFE0C36A).withValues(alpha: 0.22),
              blurRadius: 32 * opening,
              spreadRadius: 4 * opening,
            ),
          ],
        ),
      ),
    );
  }
}

class _LightBreathCue extends StatelessWidget {
  const _LightBreathCue({required this.state});

  final FirstEncounterState state;

  @override
  Widget build(BuildContext context) {
    final bool isVisible =
        state.phase.index >= FirstEncounterPhase.pupilLeafFormation.index &&
        !state.phase.isTerminal;

    return Opacity(
      opacity: isVisible ? state.phaseProgress.clamp(0.2, 1).toDouble() : 0,
      child: Container(
        key: const Key('lightBreathCue'),
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: <Color>[
              Color(0xFFE5C766),
              Color(0xFF8DA8C8),
              Color(0x00000000),
            ],
          ),
        ),
      ),
    );
  }
}

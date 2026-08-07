import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../application/first_encounter_controller.dart';
import '../domain/first_encounter_phase.dart';
import 'layers/accessibility_layer.dart';
import 'layers/first_encounter_layer_stack.dart';

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
    return FirstEncounterAccessibilityLayer(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            key: const Key('firstEncounterPresentation'),
            children: <Widget>[
              Positioned.fill(child: FirstEncounterLayerStack(state: _state)),
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

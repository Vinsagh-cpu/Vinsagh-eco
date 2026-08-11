import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../domain/orchestration/first_encounter_orchestration_stage.dart';
import '../../domain/orchestration/first_encounter_orchestrator.dart';
import '../../domain/solanf_performance/solanf_performance_phase.dart';
import '../../domain/threshold_bond/threshold_bond_phase.dart';
import '../first_encounter_presentation.dart';

class FirstEncounterOrchestratorPresentationAdapter extends StatefulWidget {
  const FirstEncounterOrchestratorPresentationAdapter({
    super.key,
    this.orchestrator,
    this.autoplay = true,
    this.debugControlsEnabled = const bool.fromEnvironment(
      'LUMEA_ENABLE_INTERNAL_PREVIEW',
    ),
  });

  final FirstEncounterOrchestrator? orchestrator;
  final bool autoplay;
  final bool debugControlsEnabled;

  @override
  State<FirstEncounterOrchestratorPresentationAdapter> createState() =>
      _FirstEncounterOrchestratorPresentationAdapterState();
}

class _FirstEncounterOrchestratorPresentationAdapterState
    extends State<FirstEncounterOrchestratorPresentationAdapter>
    with SingleTickerProviderStateMixin {
  late final FirstEncounterOrchestrator _orchestrator;
  late final bool _ownsOrchestrator;
  Ticker? _ticker;
  Duration? _lastTickElapsed;

  @override
  void initState() {
    super.initState();
    _ownsOrchestrator = widget.orchestrator == null;
    _orchestrator = widget.orchestrator ?? FirstEncounterOrchestrator();

    if (widget.autoplay) {
      _startTicker();
    }
  }

  @override
  void didUpdateWidget(
    covariant FirstEncounterOrchestratorPresentationAdapter oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);

    if (!oldWidget.autoplay && widget.autoplay) {
      _startTicker();
    }

    if (oldWidget.autoplay && !widget.autoplay) {
      _stopTicker();
    }
  }

  @override
  void dispose() {
    _stopTicker();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orchestrationState = _orchestrator.state;

    if (!widget.debugControlsEnabled) {
      return const FirstEncounterPresentation();
    }

    return Stack(
      key: const Key('firstEncounterOrchestratorPresentationAdapter'),
      fit: StackFit.expand,
      children: <Widget>[
        const FirstEncounterPresentation(),
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: SafeArea(
            child: _OrchestrationDebugPanel(
              stageCode: orchestrationState.stage.code,
              solanfPhaseCode: orchestrationState.solanfState.phase.code,
              thresholdBondPhaseCode:
                  orchestrationState.thresholdBondState.phase.code,
              showGuardianRecognitionAction:
                  orchestrationState.isWaitingForGuardian,
              onGuardianRecognitionAccepted: _acceptGuardianRecognition,
            ),
          ),
        ),
      ],
    );
  }

  void _startTicker() {
    if (_ticker?.isActive ?? false) {
      return;
    }

    _lastTickElapsed = null;
    _ticker ??= createTicker(_handleTick);
    _ticker!.start();
  }

  void _stopTicker() {
    _ticker?.stop();
    _lastTickElapsed = null;
  }

  void _handleTick(Duration elapsed) {
    final Duration delta = _lastTickElapsed == null
        ? elapsed
        : elapsed - _lastTickElapsed!;

    _lastTickElapsed = elapsed;

    if (delta > Duration.zero) {
      _orchestrator.advance(delta);
    }

    if (!mounted) {
      return;
    }

    setState(() {});

    final stage = _orchestrator.state.stage;

    if (stage == FirstEncounterOrchestrationStage.waitingForGuardian ||
        stage.isTerminal) {
      _stopTicker();
    }
  }

  void _acceptGuardianRecognition() {
    _orchestrator.acceptGuardianRecognition();

    if (mounted) {
      setState(() {});
    }

    if (widget.autoplay && !_orchestrator.state.isTerminal) {
      _startTicker();
    }
  }
}

class _OrchestrationDebugPanel extends StatelessWidget {
  const _OrchestrationDebugPanel({
    required this.stageCode,
    required this.solanfPhaseCode,
    required this.thresholdBondPhaseCode,
    required this.showGuardianRecognitionAction,
    required this.onGuardianRecognitionAccepted,
  });

  final String stageCode;
  final String solanfPhaseCode;
  final String thresholdBondPhaseCode;
  final bool showGuardianRecognitionAction;
  final VoidCallback onGuardianRecognitionAccepted;

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle = Theme.of(
      context,
    ).textTheme.bodySmall!.copyWith(color: const Color(0xFFEDE7D0));

    return Material(
      key: const Key('firstEncounterOrchestrationDebugPanel'),
      color: const Color(0xDD10100E),
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('First Encounter Orchestrator', style: labelStyle),
            const SizedBox(height: 8),
            Text(
              'Stage: $stageCode',
              key: const Key('firstEncounterOrchestrationStageReadout'),
              style: labelStyle,
            ),
            Text(
              'Solanf: $solanfPhaseCode',
              key: const Key('firstEncounterSolanfPhaseReadout'),
              style: labelStyle,
            ),
            Text(
              'Threshold: $thresholdBondPhaseCode',
              key: const Key('firstEncounterThresholdBondPhaseReadout'),
              style: labelStyle,
            ),
            if (showGuardianRecognitionAction) ...<Widget>[
              const SizedBox(height: 8),
              FilledButton(
                key: const Key('guardianRecognitionAcceptedButton'),
                onPressed: onGuardianRecognitionAccepted,
                child: const Text('guardianRecognitionAccepted'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

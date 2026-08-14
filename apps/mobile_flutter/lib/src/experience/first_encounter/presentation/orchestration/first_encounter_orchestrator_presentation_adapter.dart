import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../application/first_encounter_controller.dart';
import '../../domain/orchestration/first_encounter_orchestration_stage.dart';
import '../../domain/orchestration/first_encounter_orchestrator.dart';
import '../../domain/solanf_performance/solanf_performance_phase.dart';
import '../../domain/threshold_bond/threshold_bond_phase.dart';
import '../first_encounter_presentation.dart';
import '../visual_state/first_encounter_canonical_visual_state.dart';

class FirstEncounterOrchestratorPresentationAdapter extends StatefulWidget {
  const FirstEncounterOrchestratorPresentationAdapter({
    super.key,
    this.orchestrator,
    this.visualController,
    this.autoplay = true,
    this.debugControlsEnabled = const bool.fromEnvironment(
      'LUMEA_ENABLE_INTERNAL_PREVIEW',
    ),
  });

  final FirstEncounterOrchestrator? orchestrator;
  final FirstEncounterController? visualController;
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
  late final FirstEncounterController _visualController;
  late final bool _ownsVisualController;

  Ticker? _ticker;
  Duration? _lastTickElapsed;

  @override
  void initState() {
    super.initState();

    _orchestrator = widget.orchestrator ?? FirstEncounterOrchestrator();
    _ownsVisualController = widget.visualController == null;
    _visualController = widget.visualController ?? FirstEncounterController();

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
    _ticker?.dispose();
    _ticker = null;

    if (_ownsVisualController) {
      _visualController.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orchestrationState = _orchestrator.state;
    final canonicalVisualState =
        FirstEncounterCanonicalVisualState.fromOrchestrationState(
          orchestrationState,
        );

    if (!widget.debugControlsEnabled) {
      return _buildSyncedPlaceholder();
    }

    return Stack(
      key: const Key('firstEncounterOrchestratorPresentationAdapter'),
      fit: StackFit.expand,
      children: <Widget>[
        _buildSyncedPlaceholder(),
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
              visualPhaseCode: _visualController.phase.name,
              canonicalVisualMomentCode: canonicalVisualState.moment.name,
              footprintPlacementCode:
                  canonicalVisualState.footprintPlacement.name,
              footprintVisibilityCode:
                  canonicalVisualState.footprintVisibility.name,
              aVisualStateCode: canonicalVisualState.aVisualState.name,
              biometricPolicyCode: canonicalVisualState.exposesRealBiometricData
                  ? 'realBiometricData'
                  : 'abstractOnly',
              accessibilityPolicyCode:
                  canonicalVisualState.supportsReducedMotionAlternative
                  ? 'reducedMotionSupported'
                  : 'reducedMotionMissing',
              externalScopePolicyCode:
                  canonicalVisualState.referencesDc006 ||
                      !canonicalVisualState.excludesCompiAndLumi
                  ? 'externalScopeIncluded'
                  : 'dc006CompiLumiExcluded',
              showGuardianRecognitionAction:
                  orchestrationState.isWaitingForGuardian,
              onGuardianRecognitionAccepted: _acceptGuardianRecognition,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSyncedPlaceholder() {
    return FirstEncounterPresentation(
      controller: _visualController,
      autoplay: false,
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

    if (delta > Duration.zero && !_orchestrator.state.isTerminal) {
      _orchestrator.advance(delta);
      _visualController.advance(delta);
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
    required this.visualPhaseCode,
    required this.canonicalVisualMomentCode,
    required this.footprintPlacementCode,
    required this.footprintVisibilityCode,
    required this.aVisualStateCode,
    required this.biometricPolicyCode,
    required this.accessibilityPolicyCode,
    required this.externalScopePolicyCode,
    required this.showGuardianRecognitionAction,
    required this.onGuardianRecognitionAccepted,
  });

  final String stageCode;
  final String solanfPhaseCode;
  final String thresholdBondPhaseCode;
  final String visualPhaseCode;
  final String canonicalVisualMomentCode;
  final String footprintPlacementCode;
  final String footprintVisibilityCode;
  final String aVisualStateCode;
  final String biometricPolicyCode;
  final String accessibilityPolicyCode;
  final String externalScopePolicyCode;
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
        child: SingleChildScrollView(
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
              Text(
                'Visual: $visualPhaseCode',
                key: const Key('firstEncounterVisualPhaseReadout'),
                style: labelStyle,
              ),
              const SizedBox(height: 8),
              Text(
                'Canonical: $canonicalVisualMomentCode',
                key: const Key('firstEncounterCanonicalVisualMomentReadout'),
                style: labelStyle,
              ),
              Text(
                'Footprint placement: $footprintPlacementCode',
                key: const Key('firstEncounterFootprintPlacementReadout'),
                style: labelStyle,
              ),
              Text(
                'Footprint visibility: $footprintVisibilityCode',
                key: const Key('firstEncounterFootprintVisibilityReadout'),
                style: labelStyle,
              ),
              Text(
                'A: $aVisualStateCode',
                key: const Key('firstEncounterAVisualStateReadout'),
                style: labelStyle,
              ),
              Text(
                'Biometric: $biometricPolicyCode',
                key: const Key('firstEncounterBiometricPolicyReadout'),
                style: labelStyle,
              ),
              Text(
                'Accessibility: $accessibilityPolicyCode',
                key: const Key('firstEncounterAccessibilityPolicyReadout'),
                style: labelStyle,
              ),
              Text(
                'Scope: $externalScopePolicyCode',
                key: const Key('firstEncounterExternalScopePolicyReadout'),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'lumea_light_profile.dart';
import 'procedural_light_painter.dart';
import 'procedural_light_parameters.dart';

class LightPreviewHarness extends StatefulWidget {
  const LightPreviewHarness({
    super.key,
    this.initialPreset = LumeaLightProfilePreset.presence,
  });

  final LumeaLightProfilePreset initialPreset;

  @override
  State<LightPreviewHarness> createState() => _LightPreviewHarnessState();
}

class _LightPreviewHarnessState extends State<LightPreviewHarness> {
  static final List<LumeaLightProfilePreset> _availablePresets =
      LumeaLightProfilePreset.values
          .where((LumeaLightProfilePreset preset) {
            return preset != LumeaLightProfilePreset.custom;
          })
          .toList(growable: false);

  late LumeaLightProfilePreset _selectedPreset;
  double _phaseProgress = 1;
  double _intensityMultiplier = 1;
  double _spreadMultiplier = 1;
  double _silverMultiplier = 1;

  @override
  void initState() {
    super.initState();
    _selectedPreset = widget.initialPreset;
  }

  @override
  Widget build(BuildContext context) {
    final LumeaLightProfile profile = LumeaLightProfile.preset(_selectedPreset);
    final ProceduralLightParameters parameters = _previewParametersFor(profile);

    return Container(
      key: const Key('lightPreviewHarness'),
      color: const Color(0xFF050505),
      child: Column(
        children: <Widget>[
          Expanded(
            child: _LightPreviewCanvas(
              parameters: parameters,
              seed: _phaseProgress,
            ),
          ),
          _LightPreviewControls(
            profile: profile,
            selectedPreset: _selectedPreset,
            availablePresets: _availablePresets,
            phaseProgress: _phaseProgress,
            intensityMultiplier: _intensityMultiplier,
            spreadMultiplier: _spreadMultiplier,
            silverMultiplier: _silverMultiplier,
            onPresetChanged: (LumeaLightProfilePreset preset) {
              setState(() {
                _selectedPreset = preset;
              });
            },
            onPhaseChanged: (double value) {
              setState(() {
                _phaseProgress = value;
              });
            },
            onIntensityChanged: (double value) {
              setState(() {
                _intensityMultiplier = value;
              });
            },
            onSpreadChanged: (double value) {
              setState(() {
                _spreadMultiplier = value;
              });
            },
            onSilverChanged: (double value) {
              setState(() {
                _silverMultiplier = value;
              });
            },
          ),
        ],
      ),
    );
  }

  ProceduralLightParameters _previewParametersFor(LumeaLightProfile profile) {
    final ProceduralLightParameters baseParameters = profile
        .toProceduralLightParameters(phaseProgress: _phaseProgress);

    return ProceduralLightParameters.clamped(
      intensity: _scaledUnit(baseParameters.intensity, _intensityMultiplier),
      colorMix: baseParameters.colorMix,
      pulse: baseParameters.pulse,
      spread: _scaledUnit(baseParameters.spread, _spreadMultiplier),
      noise: baseParameters.noise,
      trail: baseParameters.trail,
      focus: baseParameters.focus,
      silverGlint: _scaledUnit(baseParameters.silverGlint, _silverMultiplier),
    );
  }

  double _scaledUnit(double value, double multiplier) {
    return (value * multiplier).clamp(0, 1).toDouble();
  }
}

class _LightPreviewCanvas extends StatelessWidget {
  const _LightPreviewCanvas({required this.parameters, required this.seed});

  final ProceduralLightParameters parameters;
  final double seed;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        key: const Key('lightPreviewCanvas'),
        painter: ProceduralLightPainter(parameters: parameters, seed: seed),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _LightPreviewControls extends StatelessWidget {
  const _LightPreviewControls({
    required this.profile,
    required this.selectedPreset,
    required this.availablePresets,
    required this.phaseProgress,
    required this.intensityMultiplier,
    required this.spreadMultiplier,
    required this.silverMultiplier,
    required this.onPresetChanged,
    required this.onPhaseChanged,
    required this.onIntensityChanged,
    required this.onSpreadChanged,
    required this.onSilverChanged,
  });

  final LumeaLightProfile profile;
  final LumeaLightProfilePreset selectedPreset;
  final List<LumeaLightProfilePreset> availablePresets;
  final double phaseProgress;
  final double intensityMultiplier;
  final double spreadMultiplier;
  final double silverMultiplier;
  final ValueChanged<LumeaLightProfilePreset> onPresetChanged;
  final ValueChanged<double> onPhaseChanged;
  final ValueChanged<double> onIntensityChanged;
  final ValueChanged<double> onSpreadChanged;
  final ValueChanged<double> onSilverChanged;

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle = Theme.of(
      context,
    ).textTheme.bodyMedium!.copyWith(color: const Color(0xFFEDE7D0));
    final TextStyle valueStyle = Theme.of(
      context,
    ).textTheme.bodySmall!.copyWith(color: const Color(0xFFB8B8B8));

    return Material(
      color: const Color(0xFF10100E),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              key: Key('activeLightProfile-${profile.code}'),
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Light Preview / Tuning Harness', style: labelStyle),
                const SizedBox(height: 8),
                DropdownButton<LumeaLightProfilePreset>(
                  key: const Key('lightProfilePresetDropdown'),
                  value: selectedPreset,
                  dropdownColor: const Color(0xFF181815),
                  style: labelStyle,
                  items: availablePresets
                      .map(
                        (LumeaLightProfilePreset preset) =>
                            DropdownMenuItem<LumeaLightProfilePreset>(
                              value: preset,
                              child: Text(
                                LumeaLightProfile.preset(preset).code,
                              ),
                            ),
                      )
                      .toList(),
                  onChanged: (LumeaLightProfilePreset? value) {
                    if (value == null) {
                      return;
                    }

                    onPresetChanged(value);
                  },
                ),
                Text(
                  profile.intention,
                  key: const Key('lightPreviewIntention'),
                  style: valueStyle,
                ),
                const SizedBox(height: 12),
                _TuningSlider(
                  key: const Key('lightPreviewPhaseSlider'),
                  label: 'Phase progress',
                  value: phaseProgress,
                  min: 0,
                  max: 1,
                  divisions: 10,
                  onChanged: onPhaseChanged,
                ),
                _TuningSlider(
                  key: const Key('lightPreviewIntensitySlider'),
                  label: 'Intensity tuning',
                  value: intensityMultiplier,
                  min: 0,
                  max: 1.4,
                  divisions: 14,
                  onChanged: onIntensityChanged,
                ),
                _TuningSlider(
                  key: const Key('lightPreviewSpreadSlider'),
                  label: 'Spread tuning',
                  value: spreadMultiplier,
                  min: 0.5,
                  max: 1.4,
                  divisions: 9,
                  onChanged: onSpreadChanged,
                ),
                _TuningSlider(
                  key: const Key('lightPreviewSilverSlider'),
                  label: 'Silver accent tuning',
                  value: silverMultiplier,
                  min: 0,
                  max: 1.2,
                  divisions: 12,
                  onChanged: onSilverChanged,
                ),
                const SizedBox(height: 8),
                Text(
                  'Preset ${profile.code} · intensity ${profile.intensity.toStringAsFixed(2)} · silver ${profile.silverGlint.toStringAsFixed(2)}',
                  key: const Key('lightPreviewParameterReadout'),
                  style: valueStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TuningSlider extends StatelessWidget {
  const _TuningSlider({
    super.key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
  });

  final String label;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle = Theme.of(
      context,
    ).textTheme.bodySmall!.copyWith(color: const Color(0xFFEDE7D0));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('$label: ${value.toStringAsFixed(2)}', style: labelStyle),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

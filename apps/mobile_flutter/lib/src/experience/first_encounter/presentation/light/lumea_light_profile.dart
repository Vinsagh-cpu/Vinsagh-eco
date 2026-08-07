import 'procedural_light_parameters.dart';

enum LumeaLightProfilePreset {
  presence,
  observation,
  gaze,
  recognition,
  reverence,
  trace,
  waiting,
  contact,
  bond,
  threshold,
  custom,
}

class LumeaLightProfile {
  const LumeaLightProfile({
    required this.preset,
    required this.code,
    required this.intention,
    required this.intensity,
    required this.radiusScale,
    required this.opacity,
    required this.warmthGold,
    required this.coolDepth,
    required this.silverGlint,
    required this.breathAmplitude,
    required this.breathPeriod,
    required this.pulseAmplitude,
    required this.pulsePeriod,
    required this.organicVariation,
    required this.focus,
    required this.softness,
    required this.transitionDuration,
  });

  factory LumeaLightProfile.preset(LumeaLightProfilePreset preset) {
    return switch (preset) {
      LumeaLightProfilePreset.presence => const LumeaLightProfile(
        preset: LumeaLightProfilePreset.presence,
        code: 'PRESENCIA',
        intention: 'Algo llego',
        intensity: 0.05,
        radiusScale: 0.22,
        opacity: 0.42,
        warmthGold: 0.88,
        coolDepth: 0.08,
        silverGlint: 0,
        breathAmplitude: 0.08,
        breathPeriod: 5.5,
        pulseAmplitude: 0,
        pulsePeriod: 5.5,
        organicVariation: 0.20,
        focus: 0.18,
        softness: 0.88,
        transitionDuration: Duration(milliseconds: 1250),
      ),
      LumeaLightProfilePreset.observation => const LumeaLightProfile(
        preset: LumeaLightProfilePreset.observation,
        code: 'OBSERVACION',
        intention: 'Quien eres',
        intensity: 0.12,
        radiusScale: 0.28,
        opacity: 0.52,
        warmthGold: 0.86,
        coolDepth: 0.12,
        silverGlint: 0,
        breathAmplitude: 0.14,
        breathPeriod: 4.8,
        pulseAmplitude: 0.02,
        pulsePeriod: 4.8,
        organicVariation: 0.22,
        focus: 0.26,
        softness: 0.78,
        transitionDuration: Duration(milliseconds: 1000),
      ),
      LumeaLightProfilePreset.gaze => const LumeaLightProfile(
        preset: LumeaLightProfilePreset.gaze,
        code: 'MIRADA',
        intention: 'Te estoy viendo',
        intensity: 0.22,
        radiusScale: 0.34,
        opacity: 0.58,
        warmthGold: 0.82,
        coolDepth: 0.16,
        silverGlint: 0.02,
        breathAmplitude: 0.18,
        breathPeriod: 4.2,
        pulseAmplitude: 0.03,
        pulsePeriod: 4.2,
        organicVariation: 0.18,
        focus: 0.38,
        softness: 0.66,
        transitionDuration: Duration(milliseconds: 900),
      ),
      LumeaLightProfilePreset.recognition => const LumeaLightProfile(
        preset: LumeaLightProfilePreset.recognition,
        code: 'RECONOCIMIENTO',
        intention: 'Se quien eres',
        intensity: 0.30,
        radiusScale: 0.40,
        opacity: 0.64,
        warmthGold: 0.86,
        coolDepth: 0.15,
        silverGlint: 0.05,
        breathAmplitude: 0.20,
        breathPeriod: 4.6,
        pulseAmplitude: 0.04,
        pulsePeriod: 4.6,
        organicVariation: 0.16,
        focus: 0.52,
        softness: 0.56,
        transitionDuration: Duration(milliseconds: 800),
      ),
      LumeaLightProfilePreset.reverence => const LumeaLightProfile(
        preset: LumeaLightProfilePreset.reverence,
        code: 'REVERENCIA',
        intention: 'Confio en ti',
        intensity: 0.20,
        radiusScale: 0.36,
        opacity: 0.54,
        warmthGold: 0.92,
        coolDepth: 0.08,
        silverGlint: 0.02,
        breathAmplitude: 0.14,
        breathPeriod: 5.2,
        pulseAmplitude: 0.02,
        pulsePeriod: 5.2,
        organicVariation: 0.20,
        focus: 0.30,
        softness: 0.76,
        transitionDuration: Duration(milliseconds: 1300),
      ),
      LumeaLightProfilePreset.trace => const LumeaLightProfile(
        preset: LumeaLightProfilePreset.trace,
        code: 'HUELLA',
        intention: 'Te ofrezco mi legado',
        intensity: 0.34,
        radiusScale: 0.46,
        opacity: 0.68,
        warmthGold: 0.90,
        coolDepth: 0.14,
        silverGlint: 0.04,
        breathAmplitude: 0.22,
        breathPeriod: 4.8,
        pulseAmplitude: 0.05,
        pulsePeriod: 4.8,
        organicVariation: 0.24,
        focus: 0.44,
        softness: 0.62,
        transitionDuration: Duration(milliseconds: 1100),
      ),
      LumeaLightProfilePreset.waiting => const LumeaLightProfile(
        preset: LumeaLightProfilePreset.waiting,
        code: 'ESPERA',
        intention: 'La invitacion esta viva',
        intensity: 0.28,
        radiusScale: 0.44,
        opacity: 0.62,
        warmthGold: 0.88,
        coolDepth: 0.13,
        silverGlint: 0.03,
        breathAmplitude: 0.16,
        breathPeriod: 4.6,
        pulseAmplitude: 0.08,
        pulsePeriod: 4.1,
        organicVariation: 0.30,
        focus: 0.32,
        softness: 0.72,
        transitionDuration: Duration(milliseconds: 1600),
      ),
      LumeaLightProfilePreset.contact => const LumeaLightProfile(
        preset: LumeaLightProfilePreset.contact,
        code: 'CONTACTO',
        intention: 'Acepto',
        intensity: 0.18,
        radiusScale: 0.30,
        opacity: 0.46,
        warmthGold: 0.86,
        coolDepth: 0.06,
        silverGlint: 0,
        breathAmplitude: 0.08,
        breathPeriod: 0.7,
        pulseAmplitude: 0,
        pulsePeriod: 0.7,
        organicVariation: 0.10,
        focus: 0.58,
        softness: 0.48,
        transitionDuration: Duration(milliseconds: 700),
      ),
      LumeaLightProfilePreset.bond => const LumeaLightProfile(
        preset: LumeaLightProfilePreset.bond,
        code: 'VINCULO',
        intention: 'Nos reconocemos',
        intensity: 0.48,
        radiusScale: 0.58,
        opacity: 0.74,
        warmthGold: 0.90,
        coolDepth: 0.18,
        silverGlint: 0.06,
        breathAmplitude: 0.24,
        breathPeriod: 3.8,
        pulseAmplitude: 0.10,
        pulsePeriod: 3.8,
        organicVariation: 0.24,
        focus: 0.46,
        softness: 0.58,
        transitionDuration: Duration(milliseconds: 2200),
      ),
      LumeaLightProfilePreset.threshold => const LumeaLightProfile(
        preset: LumeaLightProfilePreset.threshold,
        code: 'UMBRAL',
        intention: 'Ahora puedes verlo',
        intensity: 0.68,
        radiusScale: 0.72,
        opacity: 0.82,
        warmthGold: 0.84,
        coolDepth: 0.20,
        silverGlint: 0.04,
        breathAmplitude: 0.18,
        breathPeriod: 5.4,
        pulseAmplitude: 0.03,
        pulsePeriod: 5.4,
        organicVariation: 0.20,
        focus: 0.34,
        softness: 0.70,
        transitionDuration: Duration(milliseconds: 2200),
      ),
      LumeaLightProfilePreset.custom => throw ArgumentError(
        'Use LumeaLightProfile.custom for custom light profiles.',
      ),
    };
  }

  factory LumeaLightProfile.custom({
    String code = 'CUSTOM',
    String intention = 'Custom light tuning',
    required double intensity,
    required double radiusScale,
    required double opacity,
    required double warmthGold,
    required double coolDepth,
    required double silverGlint,
    required double breathAmplitude,
    required double breathPeriod,
    required double pulseAmplitude,
    required double pulsePeriod,
    required double organicVariation,
    required double focus,
    required double softness,
    required Duration transitionDuration,
  }) {
    return LumeaLightProfile(
      preset: LumeaLightProfilePreset.custom,
      code: code,
      intention: intention,
      intensity: _unit(intensity),
      radiusScale: _unit(radiusScale),
      opacity: _unit(opacity),
      warmthGold: _unit(warmthGold),
      coolDepth: _unit(coolDepth),
      silverGlint: _unit(silverGlint),
      breathAmplitude: _unit(breathAmplitude),
      breathPeriod: breathPeriod <= 0 ? 1 : breathPeriod,
      pulseAmplitude: _unit(pulseAmplitude),
      pulsePeriod: pulsePeriod <= 0 ? 1 : pulsePeriod,
      organicVariation: _unit(organicVariation),
      focus: _unit(focus),
      softness: _unit(softness),
      transitionDuration: transitionDuration.isNegative
          ? Duration.zero
          : transitionDuration,
    );
  }

  final LumeaLightProfilePreset preset;
  final String code;
  final String intention;
  final double intensity;
  final double radiusScale;
  final double opacity;
  final double warmthGold;
  final double coolDepth;
  final double silverGlint;
  final double breathAmplitude;
  final double breathPeriod;
  final double pulseAmplitude;
  final double pulsePeriod;
  final double organicVariation;
  final double focus;
  final double softness;
  final Duration transitionDuration;

  double get minimumBreathingIntensity {
    return _unit(intensity - (breathAmplitude * 0.5));
  }

  bool get suspendsBreathAndPulse {
    return preset == LumeaLightProfilePreset.contact && pulseAmplitude == 0;
  }

  bool get keepsSilverAsAccent {
    return silverGlint <= 0.06 && silverGlint < warmthGold;
  }

  LumeaLightProfile copyWith({
    String? code,
    String? intention,
    double? intensity,
    double? radiusScale,
    double? opacity,
    double? warmthGold,
    double? coolDepth,
    double? silverGlint,
    double? breathAmplitude,
    double? breathPeriod,
    double? pulseAmplitude,
    double? pulsePeriod,
    double? organicVariation,
    double? focus,
    double? softness,
    Duration? transitionDuration,
  }) {
    return LumeaLightProfile.custom(
      code: code ?? this.code,
      intention: intention ?? this.intention,
      intensity: intensity ?? this.intensity,
      radiusScale: radiusScale ?? this.radiusScale,
      opacity: opacity ?? this.opacity,
      warmthGold: warmthGold ?? this.warmthGold,
      coolDepth: coolDepth ?? this.coolDepth,
      silverGlint: silverGlint ?? this.silverGlint,
      breathAmplitude: breathAmplitude ?? this.breathAmplitude,
      breathPeriod: breathPeriod ?? this.breathPeriod,
      pulseAmplitude: pulseAmplitude ?? this.pulseAmplitude,
      pulsePeriod: pulsePeriod ?? this.pulsePeriod,
      organicVariation: organicVariation ?? this.organicVariation,
      focus: focus ?? this.focus,
      softness: softness ?? this.softness,
      transitionDuration: transitionDuration ?? this.transitionDuration,
    );
  }

  ProceduralLightParameters toProceduralLightParameters({
    double phaseProgress = 1,
  }) {
    final double activation = 0.86 + (_unit(phaseProgress) * 0.14);
    final double effectiveIntensity = _unit(intensity * opacity * activation);
    final double effectivePulse = _unit(
      (breathAmplitude * 0.55) + pulseAmplitude,
    );

    return ProceduralLightParameters.clamped(
      intensity: effectiveIntensity,
      colorMix: LumeaLightColorMix.ancientGold(
        mistGrey: coolDepth * 0.62,
        skyBlue: coolDepth * 0.52,
        violet: coolDepth * 0.34,
        silver: silverGlint,
      ),
      pulse: suspendsBreathAndPulse ? 0 : effectivePulse,
      spread: radiusScale,
      noise: organicVariation,
      trail: _trailForPreset,
      focus: _unit(focus * (1 - (softness * 0.18))),
      silverGlint: silverGlint,
    );
  }

  static LumeaLightProfile lerp(
    LumeaLightProfile begin,
    LumeaLightProfile end,
    double t,
  ) {
    final double progress = _unit(t);

    return LumeaLightProfile.custom(
      code: '${begin.code}_TO_${end.code}',
      intention: 'Light profile transition',
      intensity: _lerp(begin.intensity, end.intensity, progress),
      radiusScale: _lerp(begin.radiusScale, end.radiusScale, progress),
      opacity: _lerp(begin.opacity, end.opacity, progress),
      warmthGold: _lerp(begin.warmthGold, end.warmthGold, progress),
      coolDepth: _lerp(begin.coolDepth, end.coolDepth, progress),
      silverGlint: _lerp(begin.silverGlint, end.silverGlint, progress),
      breathAmplitude: _lerp(
        begin.breathAmplitude,
        end.breathAmplitude,
        progress,
      ),
      breathPeriod: _lerp(begin.breathPeriod, end.breathPeriod, progress),
      pulseAmplitude: _lerp(begin.pulseAmplitude, end.pulseAmplitude, progress),
      pulsePeriod: _lerp(begin.pulsePeriod, end.pulsePeriod, progress),
      organicVariation: _lerp(
        begin.organicVariation,
        end.organicVariation,
        progress,
      ),
      focus: _lerp(begin.focus, end.focus, progress),
      softness: _lerp(begin.softness, end.softness, progress),
      transitionDuration: Duration(
        milliseconds: _lerp(
          begin.transitionDuration.inMilliseconds.toDouble(),
          end.transitionDuration.inMilliseconds.toDouble(),
          progress,
        ).round(),
      ),
    );
  }

  double get _trailForPreset {
    return switch (preset) {
      LumeaLightProfilePreset.trace => 0.26,
      LumeaLightProfilePreset.waiting => 0.18,
      LumeaLightProfilePreset.bond => 0.22,
      LumeaLightProfilePreset.threshold => 0.16,
      LumeaLightProfilePreset.custom => 0.10,
      _ => 0.05,
    };
  }

  static double _unit(double value) {
    if (value.isNaN) {
      return 0;
    }

    return value.clamp(0, 1).toDouble();
  }

  static double _lerp(double begin, double end, double t) {
    return begin + ((end - begin) * t);
  }
}

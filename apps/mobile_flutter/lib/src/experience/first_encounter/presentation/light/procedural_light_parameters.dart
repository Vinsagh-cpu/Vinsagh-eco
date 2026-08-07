class LumeaLightColorMix {
  const LumeaLightColorMix({
    required this.ancientGold,
    required this.mistGrey,
    required this.skyBlue,
    required this.violet,
    required this.silver,
  });

  factory LumeaLightColorMix.ancientGold({
    double mistGrey = 0.18,
    double skyBlue = 0.12,
    double violet = 0.08,
    double silver = 0.04,
  }) {
    return LumeaLightColorMix.clamped(
      ancientGold: 1,
      mistGrey: mistGrey,
      skyBlue: skyBlue,
      violet: violet,
      silver: silver,
    );
  }

  factory LumeaLightColorMix.clamped({
    required double ancientGold,
    required double mistGrey,
    required double skyBlue,
    required double violet,
    required double silver,
  }) {
    return LumeaLightColorMix(
      ancientGold: _clampUnit(ancientGold),
      mistGrey: _clampUnit(mistGrey),
      skyBlue: _clampUnit(skyBlue),
      violet: _clampUnit(violet),
      silver: _clampUnit(silver),
    );
  }

  final double ancientGold;
  final double mistGrey;
  final double skyBlue;
  final double violet;
  final double silver;

  double get coolDepth => _clampUnit((mistGrey + skyBlue + violet) / 3);

  double get silverPresence => silver;

  static double _clampUnit(double value) {
    if (value.isNaN) {
      return 0;
    }

    return value.clamp(0, 1).toDouble();
  }
}

class ProceduralLightParameters {
  const ProceduralLightParameters({
    required this.intensity,
    required this.colorMix,
    required this.pulse,
    required this.spread,
    required this.noise,
    required this.trail,
    required this.focus,
    required this.silverGlint,
  });

  factory ProceduralLightParameters.clamped({
    required double intensity,
    LumeaLightColorMix? colorMix,
    required double pulse,
    required double spread,
    required double noise,
    required double trail,
    required double focus,
    required double silverGlint,
  }) {
    return ProceduralLightParameters(
      intensity: _clampUnit(intensity),
      colorMix: colorMix ?? LumeaLightColorMix.ancientGold(),
      pulse: _clampUnit(pulse),
      spread: _clampUnit(spread),
      noise: _clampUnit(noise),
      trail: _clampUnit(trail),
      focus: _clampUnit(focus),
      silverGlint: _clampUnit(silverGlint),
    );
  }

  factory ProceduralLightParameters.inactive() {
    return ProceduralLightParameters.clamped(
      intensity: 0,
      pulse: 0,
      spread: 0,
      noise: 0,
      trail: 0,
      focus: 0,
      silverGlint: 0,
    );
  }

  final double intensity;
  final LumeaLightColorMix colorMix;
  final double pulse;
  final double spread;
  final double noise;
  final double trail;
  final double focus;
  final double silverGlint;

  bool get isVisible => intensity > 0;

  double get coreRadiusFactor => 0.08 + (focus * 0.16);

  double get spreadRadiusFactor => 0.22 + (spread * 0.48);

  double get glintOpacity => _clampUnit(intensity * silverGlint * 0.72);

  double get organicOffsetFactor => (noise - 0.5) * 0.08;

  static double _clampUnit(double value) {
    if (value.isNaN) {
      return 0;
    }

    return value.clamp(0, 1).toDouble();
  }
}

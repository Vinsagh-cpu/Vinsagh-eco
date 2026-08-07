import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'procedural_light_parameters.dart';

class ProceduralLightPainter extends CustomPainter {
  const ProceduralLightPainter({required this.parameters, required this.seed});

  final ProceduralLightParameters parameters;
  final double seed;

  @override
  void paint(Canvas canvas, Size size) {
    if (!parameters.isVisible || size.isEmpty) {
      return;
    }

    final Offset center = size.center(Offset.zero);
    final double shortestSide = size.shortestSide;
    final double pulseScale =
        1 + (math.sin(seed * math.pi * 2) * 0.035 * parameters.pulse);
    final double organicOffset =
        shortestSide *
        parameters.organicOffsetFactor *
        math.sin(seed * math.pi);

    final Offset organicCenter = center.translate(
      organicOffset,
      -organicOffset * 0.4,
    );
    final double coreRadius =
        shortestSide * parameters.coreRadiusFactor * pulseScale;
    final double spreadRadius =
        shortestSide * parameters.spreadRadiusFactor * pulseScale;

    _paintMainGlow(
      canvas: canvas,
      center: organicCenter,
      coreRadius: coreRadius,
      spreadRadius: spreadRadius,
    );

    _paintOrganicBreath(
      canvas: canvas,
      center: organicCenter,
      spreadRadius: spreadRadius,
    );

    _paintTrail(
      canvas: canvas,
      center: organicCenter,
      spreadRadius: spreadRadius,
    );

    _paintSilverGlint(
      canvas: canvas,
      center: organicCenter,
      coreRadius: coreRadius,
    );
  }

  void _paintMainGlow({
    required Canvas canvas,
    required Offset center,
    required double coreRadius,
    required double spreadRadius,
  }) {
    final Paint glowPaint = Paint()
      ..shader = ui.Gradient.radial(
        center,
        spreadRadius,
        <Color>[
          Color.lerp(
            const Color(0xFFE5C766),
            const Color(0xFFD8DDE7),
            parameters.colorMix.silverPresence * 0.18,
          )!.withValues(alpha: 0.72 * parameters.intensity),
          const Color(
            0xFFB49A50,
          ).withValues(alpha: 0.34 * parameters.intensity),
          const Color(0xFF8DA8C8).withValues(
            alpha: 0.14 * parameters.colorMix.coolDepth * parameters.intensity,
          ),
          Colors.transparent,
        ],
        <double>[
          0,
          (coreRadius / spreadRadius).clamp(0.08, 0.38).toDouble(),
          0.72,
          1,
        ],
      );

    canvas.drawCircle(center, spreadRadius, glowPaint);
  }

  void _paintOrganicBreath({
    required Canvas canvas,
    required Offset center,
    required double spreadRadius,
  }) {
    final Paint breathPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2 + (parameters.focus * 1.4)
      ..color = const Color(0xFFE5C766).withValues(
        alpha: 0.16 * parameters.intensity * (0.4 + parameters.noise),
      );

    for (int index = 0; index < 3; index += 1) {
      final double radius = spreadRadius * (0.38 + (index * 0.16));
      final Rect rect = Rect.fromCenter(
        center: center.translate(index * 2.0, -index * 1.4),
        width: radius * (1.38 + parameters.noise * 0.08),
        height: radius * (0.72 + parameters.noise * 0.06),
      );

      canvas.drawArc(
        rect,
        math.pi * (0.08 + index * 0.11),
        math.pi * (1.02 - index * 0.12),
        false,
        breathPaint,
      );
    }
  }

  void _paintTrail({
    required Canvas canvas,
    required Offset center,
    required double spreadRadius,
  }) {
    if (parameters.trail <= 0) {
      return;
    }

    final Paint trailPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round
      ..color = const Color(
        0xFFE5C766,
      ).withValues(alpha: 0.22 * parameters.trail * parameters.intensity);

    final Path trailPath = Path()
      ..moveTo(center.dx - spreadRadius * 0.52, center.dy + spreadRadius * 0.04)
      ..cubicTo(
        center.dx - spreadRadius * 0.22,
        center.dy - spreadRadius * 0.16,
        center.dx + spreadRadius * 0.2,
        center.dy + spreadRadius * 0.18,
        center.dx + spreadRadius * 0.54,
        center.dy - spreadRadius * 0.06,
      );

    canvas.drawPath(trailPath, trailPaint);
  }

  void _paintSilverGlint({
    required Canvas canvas,
    required Offset center,
    required double coreRadius,
  }) {
    if (parameters.glintOpacity <= 0) {
      return;
    }

    final Paint glintPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.1
      ..color = const Color(
        0xFFD8DDE7,
      ).withValues(alpha: parameters.glintOpacity);

    final Offset glintCenter = center.translate(
      coreRadius * 0.34,
      -coreRadius * 0.22,
    );

    canvas
      ..drawLine(
        glintCenter.translate(-coreRadius * 0.28, 0),
        glintCenter.translate(coreRadius * 0.28, 0),
        glintPaint,
      )
      ..drawLine(
        glintCenter.translate(0, -coreRadius * 0.28),
        glintCenter.translate(0, coreRadius * 0.28),
        glintPaint,
      );
  }

  @override
  bool shouldRepaint(covariant ProceduralLightPainter oldDelegate) {
    return oldDelegate.parameters != parameters || oldDelegate.seed != seed;
  }
}

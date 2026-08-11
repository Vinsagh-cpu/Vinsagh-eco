# ANIM-001A · Modelo de actuación de Solanf

## Estado

En implementación.

## Fuente de verdad

ANIM-001 · SOLANF · Actuación del Custodio en el Primer Encuentro v1.0.

## Objetivo

Crear el modelo técnico de actuación de Solanf desde presencia inicial hasta WAITING_FOR_GUARDIAN.

Este bloque no implementa render final, assets, audio, Flame, biometría ni contacto del Guardián.

## Fases modeladas

- PRESENCE
- DETECTION
- OPENING
- FOCUS
- RECOGNITION
- EXHALATION
- APPROACH
- REVERENCE
- PRESENTATION
- WAITING_FOR_GUARDIAN

## Timing aprobado

- PRESENCE: 0.0–1.2 s
- DETECTION: 1.2–1.8 s
- OPENING: 1.8–3.0 s
- FOCUS: 3.0–3.4 s
- RECOGNITION: 3.4–4.2 s
- EXHALATION: 4.2–4.8 s
- APPROACH: 4.8–6.2 s
- REVERENCE: 6.2–7.4 s
- PRESENTATION: 7.4–8.4 s
- WAITING_FOR_GUARDIAN: desde 8.4 s

## Decisión técnica

El modelo vive como timeline de dominio para poder validar timing y estado lógico antes de conectar cualquier representación visual.

WAITING_FOR_GUARDIAN es indefinido. Después de 8.4 s la actuación no continúa por temporizador.

## Restricciones protegidas

No se implementa todavía:

- Render final de Solanf.
- Huella visual final.
- A completa.
- Contacto del Guardián.
- Apertura del Umbral.
- Audio.
- Assets.
- Flame.
- Biometría.
- Cámara.
- Animación esquelética final.

## Tests agregados

- Timing aprobado de ANIM-001.
- Mapeo de tiempo transcurrido a fase.
- WAITING_FOR_GUARDIAN no avanza por temporizador.
- Progreso de fase y progreso total acotados.
- Código canónico WAITING_FOR_GUARDIAN.

## Criterio de cierre

El bloque puede cerrarse si flutter analyze y flutter test pasan en verde y el documento queda integrado en main.

# DEV-003 · Capas visuales reutilizables del Primer Encuentro

## Estado

En implementación.

## Fuente de verdad

DC-002 · Primer Encuentro · Maquetación cinematográfica y handoff a Programación v1.0.

## Objetivo

Separar la presentación del Primer Encuentro en capas reutilizables para que la escena pueda evolucionar sin acoplar arte, cámara, luz, accesibilidad o estado del motor en un solo widget.

## Capas implementadas

- `BackgroundLayer`
- `AtmosphereLayer`
- `GuardianSilhouetteLayer`
- `EyelidLayer`
- `EyeLayer`
- `FocusLayer`
- `LightLayer`
- `FirstEncounterAccessibilityLayer`
- `FirstEncounterLayerStack`

## Restricciones protegidas

No se implementa todavía:

- Arte final.
- Audio real.
- Partículas finales.
- Bosque final.
- Guardián renderizado.
- Flame.
- Firebase.
- Timeline visual definitivo.
- Assets finales.

## Decisión técnica

La presentación sigue leyendo `FirstEncounterState`.

Las capas no controlan el tiempo ni avanzan fases. Solo traducen estado y progreso en señales visuales mínimas.

El timeline central continúa en `FirstEncounterController` y `FirstEncounterTimeline`.

## Próximo paso

DEV-004 deberá introducir la luz procedural reutilizable sin usar video ni GIF.

# DEV-002 · Presentación controlada del Primer Encuentro

## Estado

En implementación.

## Fuente de verdad

DC-002 · Primer Encuentro · Maquetación cinematográfica y handoff a Programación v1.0.

## Objetivo

Conectar el motor DEV-001 con una primera presentación controlada, mínima y verificable.

## Alcance implementado

- `FirstEncounterPresentation`
- Conexión entre `LumeaAppEntry` y la presentación del Primer Encuentro.
- Avance automático mediante ticker de Flutter.
- Lectura de fase actual.
- Lectura de progreso de fase.
- Lectura de capacidad de omitir.
- Acción de omitir cuando el motor la permite.
- Pruebas de integración del entry point.
- Pruebas de presentación.

## Restricciones protegidas

No se implementa todavía:

- Arte final.
- Partículas.
- Audio.
- Bosque final.
- Guardián renderizado.
- Flame.
- Firebase.
- Timeline visual definitivo.

## Decisión técnica

La presentación no decide los tiempos. La fuente de tiempo sigue siendo el motor `FirstEncounterController` con `FirstEncounterTimeline`.

La interfaz únicamente lee estado y progreso.

## Próximo paso

DEV-003 deberá introducir la estructura formal de capas visuales reutilizables:

- BackgroundLayer
- AtmosphereLayer
- GuardianSilhouetteLayer
- EyelidLayer
- EyeLayer
- FocusLayer
- LightLayer
- AccessibilityLayer

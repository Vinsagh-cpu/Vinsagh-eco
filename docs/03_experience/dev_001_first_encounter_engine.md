# DEV-001 · Motor del Primer Encuentro

## Estado

En implementación.

## Fuente de verdad

DC-002 · Primer Encuentro · Maquetación cinematográfica y handoff a Programación v1.0.

## Objetivo

Crear la base técnica del Motor del Primer Encuentro sin implementar todavía arte, animación, audio, partículas, bosque ni render del Custodio.

## Alcance implementado

- `FirstEncounterPhase`
- `FirstEncounterEvent`
- `FirstEncounterStep`
- `FirstEncounterTimeline`
- `FirstEncounterController`
- Pruebas unitarias del timeline.
- Pruebas unitarias del controlador.

## Reglas protegidas

- La secuencia se controla desde un timeline central.
- La presentación no decide tiempos.
- No se usan `Future.delayed` dispersos.
- No se implementa una splash screen tradicional.
- No se implementa todavía el Primer Encuentro visual.
- No se agregan assets.
- No se agrega audio.
- No se agrega Flame.
- No se agrega Firebase.

## Fases oficiales

1. darkness
2. eyelidsClosed
3. earsReact
4. firstBlink
5. openingEyes
6. huntingFocus
7. recognition
8. pupilLeafFormation
9. irisLightBreath
10. silverGlint
11. lumeaInFocus
12. invitation
13. completed

## Próximo paso

Crear la primera integración de presentación como maqueta funcional controlada, sin assets finales y sin lógica temporal en la interfaz.

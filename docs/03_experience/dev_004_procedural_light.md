# DEV-004 · Luz procedural reutilizable

## Estado

En implementación.

## Fuente de verdad

FX-001 · Sistema de Luz Procedural de Lumea v1.0.

## Objetivo

Construir la base técnica de la luz procedural de Lumea como sistema reutilizable, parametrizable y testeable.

## Alcance implementado

- `LumeaLightColorMix`
- `ProceduralLightParameters`
- `ProceduralLightPainter`
- Integración en `LightLayer`
- Tests de parámetros
- Test de renderizado base de `LightLayer`

## Parámetros soportados

- `intensity`
- `colorMix`
- `pulse`
- `spread`
- `noise`
- `trail`
- `focus`
- `silverGlint`

## Restricciones protegidas

No se implementa todavía:

- Custodio final.
- Huella.
- Biometría.
- Audio.
- Assets.
- Video.
- GIF.
- Flame.
- Firebase.
- Narrativa final del Primer Encuentro.

## Decisión técnica

La luz se genera mediante `CustomPainter`.

No depende de imágenes externas, videos, GIFs ni assets finales.

`LightLayer` solo traduce el estado recibido en parámetros de luz. La capa no controla el timeline ni decide la narrativa.

## Próximo paso

Después de estabilizar la luz procedural, Dirección Creativa podrá entregar perfiles de luz por momento narrativo.

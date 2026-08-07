# DEV-005 · Perfiles de luz por momento narrativo

## Estado

En implementación.

## Fuente de verdad

FX-002 · Perfiles de luz por momento narrativo v1.0.

Dependencia:
- FX-001 · Sistema de Luz Procedural de Lumea v1.0.
- DEV-004 · Luz procedural reutilizable.

## Objetivo

Agregar una capa de perfiles configurables para dirigir `LightLayer` sin acoplar la capa a assets, personajes, audio, Flame, biometría ni narrativa final.

## Perfiles incluidos

- PRESENCIA
- OBSERVACION
- MIRADA
- RECONOCIMIENTO
- REVERENCIA
- HUELLA
- ESPERA
- CONTACTO
- VINCULO
- UMBRAL

## Decisión técnica

Los perfiles viven como configuración en `LumeaLightProfile`.

`LightLayer` no contiene valores visuales directos. Solo selecciona un preset según la fase recibida y lo adapta a `ProceduralLightParameters`.

Esto mantiene el sistema:
- Procedural.
- Reutilizable.
- Parametrizable.
- Testeable.
- Sin assets externos.

## Parámetros modelados

- `intensity`
- `radiusScale`
- `opacity`
- `warmthGold`
- `coolDepth`
- `silverGlint`
- `breathAmplitude`
- `breathPeriod`
- `pulseAmplitude`
- `pulsePeriod`
- `organicVariation`
- `focus`
- `softness`
- `transitionDuration`

## Tests agregados

- Existencia de los diez presets aprobados.
- Rangos seguros para parámetros normalizados.
- Interpolación entre presets sin saltos.
- ESPERA nunca llega a apagado total.
- CONTACTO puede suspender respiración/pulso.
- `silverGlint` se conserva como acento y nunca como luz dominante.
- Sobrescritura controlada para tuning.

## Fuera de alcance

No se implementa todavía:
- Custodio final.
- Huella visual final.
- Biometría.
- Audio.
- Assets.
- Video.
- GIF.
- Flame.
- Firebase.
- Cámara.
- Animación esquelética.
- Compi.
- Lumi.
- Textos o tutoriales.

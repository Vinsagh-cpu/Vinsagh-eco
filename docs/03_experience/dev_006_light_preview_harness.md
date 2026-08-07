# DEV-006 · Light Preview / Tuning Harness

## Estado

En implementación.

## Fuente de verdad

FX-002 · Perfiles de luz por momento narrativo v1.0.

Dependencias:
- FX-001 · Sistema de Luz Procedural de Lumea v1.0.
- DEV-004 · Luz procedural reutilizable.
- DEV-005 · Perfiles de luz por momento narrativo.

## Objetivo

Crear un harness interno para visualizar y ajustar perfiles de luz procedural sin acoplar la experiencia a narrativa final, personajes, assets, audio, Flame ni biometría.

## Alcance implementado

- `LightPreviewHarness`.
- Selector de presets aprobados.
- Preview procedural usando `ProceduralLightPainter`.
- Controles locales de tuning:
  - progreso de fase
  - intensidad
  - expansión/spread
  - acento plata
- Tests de renderizado del harness.
- Test de cambio de preset.
- Test de ajuste local sin assets.

## Decisión técnica

El harness no se conecta todavía al flujo principal de la app.

Su función es permitir revisión interna y tuning visual sin contaminar `LightLayer` ni introducir narrativa final.

## Restricciones protegidas

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
- Textos o tutoriales finales.

## Criterio de salida

El harness debe permitir inspeccionar perfiles y modificar parámetros básicos de visualización sin romper la arquitectura procedural creada en DEV-004 y configurada en DEV-005.
